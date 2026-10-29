/* Local-only protocol clients for engine acceptance; installs live in the sandbox. */
const fs = require('fs');
const path = require('path');
const http = require('http');
const { createRequire } = require('module');
const sandbox = path.resolve(process.argv[2]);
const manifest = JSON.parse(fs.readFileSync(path.join(sandbox, 'sandbox.json'), 'utf8'));
if (path.resolve(manifest.root) !== sandbox) throw new Error('Sandbox manifest mismatch');
const localRequire = createRequire(path.join(sandbox, 'clients', 'package.json'));
const mineflayer = localRequire('mineflayer');
const { Vec3 } = localRequire('vec3');
const count = Number(process.argv[3] ?? 4);
if (!Number.isInteger(count) || count < 1 || count > 20) throw new Error('Client count must be between 1 and 20');
const names = Array.from({length: count}, (_, i) => 'IE_Test' + String.fromCharCode(65 + i));
const bots = new Map();
function connect(name) {
  if (bots.has(name)) throw new Error('Client already connected');
  const bot = mineflayer.createBot({host:'127.0.0.1',port:25576,username:name,auth:'offline',version:'1.21.11',hideErrors:false});
  bots.set(name, bot);
  bot.on('spawn', () => { bot.physicsEnabled = false; console.log('SPAWN', name); });
  bot.on('death', () => { console.log('DEATH', name); setTimeout(() => { if (bot.health <= 0) bot.respawn(); }, 50); });
  bot.on('kicked', reason => console.log('KICK', name, JSON.stringify(reason)));
  bot.on('error', error => console.error('CLIENT_ERROR', name, error.stack));
}
for (const name of names) connect(name);
const server = http.createServer(async (req,res) => {
  try {
    if (req.url === '/state') {
      const state = [...bots].map(([name, b]) => ({name,health:b.health,food:b.food,entityId:b.entity?.id,position:b.entity?.position,items:b.inventory?.items().map(i=>({name:i.name,slot:i.slot,count:i.count}))}));
      res.setHeader('Content-Type','application/json');res.end(JSON.stringify(state));return;
    }
    if (req.url.startsWith('/entities?')) {
      const name = new URL(req.url, 'http://127.0.0.1').searchParams.get('name');
      const bot = bots.get(name); if (!bot) throw new Error('Unknown test client');
      res.setHeader('Content-Type','application/json');
      res.end(JSON.stringify(Object.values(bot.entities).filter(e => e.name === 'interaction').map(e => ({id:e.id,name:e.name,position:e.position})))); return;
    }
    if (req.url === '/stop') {
      res.end('stopping');for (const bot of bots.values()) bot.quit();server.close();return;
    }
    if (req.url !== '/action' || req.method !== 'POST') {res.writeHead(404);res.end();return;}
    let body='';for await (const chunk of req) {body+=chunk;if (body.length>10000) throw new Error('Request too large');}
    const data=JSON.parse(body);
    if (!names.includes(data.name)) throw new Error('Unknown test client');
    if (data.action==='connect') { connect(data.name); res.end('ok'); return; }
    const bot=bots.get(data.name);if (!bot) throw new Error('Test client is disconnected');
    if (data.action==='disconnect') { bots.delete(data.name); bot.quit(); }
    else if (data.action==='slot') bot.setQuickBarSlot(Number(data.slot));
    else if (data.action==='sneak') bot.setControlState('sneak', Boolean(data.value));
    else if (data.action==='look') await bot.lookAt(new Vec3(data.x,data.y,data.z),true);
    else if (data.action==='use') bot.activateItem(false);
    else if (data.action==='release') bot.deactivateItem();
    else if (data.action==='attack') {const target=bot.entities[data.entity];if (!target) throw new Error('Target is not tracked');bot.attack(target);}
    else if (data.action==='interact') {const target=bot.entities[data.entity];if (!target) throw new Error('Target is not tracked');bot.activateEntity(target);}
    else if (data.action==='respawn') bot.respawn();
    else throw new Error('Unknown action');
    res.end('ok');
  } catch (error) {res.writeHead(400);res.end(String(error.stack));}
});
server.listen(25578,'127.0.0.1',()=>console.log('Client control listening on 127.0.0.1:25578'));
