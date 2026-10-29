"""A deliberately small state-flow runner for repository mcfunctions.

Runs real function bodies for scoreboard/tag/attributes/control flow. World,
rendering and inventory commands are explicit stand-ins. Unsupported control
flow raises instead of silently passing. Not a game or command-syntax emulator.
"""
from dataclasses import dataclass, field
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
@dataclass
class Player:
    name: str
    tags: set = field(default_factory=set)
    scores: dict = field(default_factory=dict)
    attributes: dict = field(default_factory=dict)
    mode: str = 'adventure'
    team: str | None = None

@dataclass
class Entity(Player):
    entity_type: str = "minecraft:marker"

class Returned(Exception): pass

class Runtime:
    def __init__(self):
        self.players = [Player('A'), Player('B')]
        self.entities = []
        self.scores = {('$game','in_game'):0, ('$game','ie.match_id'):1, ('$game','ie.mode'):0, ('$game','ie.rules_saved'):0, ('$game','gs_active'):0}
        self.rules = {'natural_health_regeneration':True, 'immediate_respawn':False}
        self.scheduled = set(); self.calls = []; self.notices = []
        self.functions = {p.parts[len(ROOT.parts)+1] + ':' + p.relative_to(ROOT).as_posix().split('/function/',1)[1][:-11]: p for p in ROOT.glob('data/*/function/**/*.mcfunction')}
    def select(self, token, actor=None):
        if not token.startswith('@'): return [token]
        candidates = ([actor] if actor else []) if token.startswith('@s') else (list(self.entities) + list(self.players) if token.startswith('@e') else list(self.players))
        for key,value in re.findall(r'(tag|scores|limit|gamemode|type)=([^\]]+?)(?=,(?:tag|scores|limit|gamemode|distance|type)=|\]$|$)', token[token.find('[')+1:-1] if '[' in token else ''):
            if key=='type': candidates=[p for p in candidates if getattr(p,'entity_type','minecraft:player')==value]
            elif key=='tag': candidates=[p for p in candidates if (value[1:] not in p.tags if value.startswith('!') else value in p.tags)]
            elif key=='scores':
                for objective, ran in re.findall(r'([\w.]+)=(-?\d*(?:\.\.-?\d*)?)',value):
                    candidates=[p for p in candidates if objective in p.scores and self.matches(p.scores[objective],ran)]
            elif key=='limit': candidates=candidates[:int(value)]
            elif key=='gamemode': candidates=[p for p in candidates if p.mode==value]
        return candidates
    @staticmethod
    def matches(value, ran):
        if '..' not in ran: return value==int(ran)
        lo,hi=ran.split('..'); return (not lo or value>=int(lo)) and (not hi or value<=int(hi))
    def get(self,target,obj,actor=None):
        values=self.select(target,actor)
        if not values:return None
        v=values[0];return v.scores.get(obj) if isinstance(v,Player) else self.scores.get((v,obj))
    def set(self,target,obj,value,actor=None):
        for v in self.select(target,actor):
            if isinstance(v,Player):v.scores[obj]=value
            else:self.scores[v,obj]=value
    def run(self,fid,actor=None,macro_args=None):
        self.calls.append(fid)
        if len(self.calls)>20000:raise AssertionError('Unbounded function execution')
        try:
            body=self.functions[fid].read_text(encoding='utf-8-sig').replace('\\\n', '')
            for line in body.splitlines():
                line=line.strip()
                if not line or line.startswith('#'): continue
                if line.startswith('$execute') and '$(' in line:
                    if macro_args is None: raise AssertionError('Missing macro arguments: '+fid)
                    line=re.sub(r'\$\((\w+)\)',lambda m:macro_args[m.group(1)],line[1:])
                self.command(line,actor)
        except Returned:pass
    def command(self,line,actor=None):
        a=line.split();root=a[0]
        if root in ('$item', '$give'):return 1  # Inventory rendering macros are explicit stand-ins.
        if root=='return':raise Returned()
        if root=='function':
            args=dict(re.findall(r'([a-zA-Z_][\w]*):"([a-zA-Z0-9_./-]+)"',line)) or None
            self.run(a[1],actor,args);return 1
        if root=='execute':return self.execute(a[1:],actor)
        if root=='scoreboard':
            if a[1]=='objectives':return 1
            action,target,obj=a[2:5]
            if action=='enable':return 1
            if action=='reset':
                for p in self.select(target,actor):
                    (p.scores.pop(obj,None) if isinstance(p,Player) else self.scores.pop((p,obj),None))
                return 1
            if action=='get':return self.get(target,obj,actor) or 0
            if action=='operation':
                rhs=self.get(a[6],a[7],actor)
                if rhs is None:return 0
                for p in self.select(target,actor):
                    lhs=p.scores.get(obj,0) if isinstance(p,Player) else self.scores.get((p,obj),0)
                    op=a[5];value={'=':lambda:rhs,'+=':lambda:lhs+rhs,'-=':lambda:lhs-rhs,'*=':lambda:lhs*rhs,'%=':lambda:lhs%rhs,'/=':lambda:int(lhs/rhs)}[op]()
                    self.set(p.name if isinstance(p,Player) else p,obj,value) if not isinstance(p,Player) else p.scores.__setitem__(obj,value)
                return 1
            for p in self.select(target,actor):
                current=p.scores.get(obj,0) if isinstance(p,Player) else self.scores.get((p,obj),0)
                value=int(a[5]) if action=='set' else current+int(a[5])*(1 if action=='add' else -1)
                if isinstance(p,Player):p.scores[obj]=value
                else:self.scores[p,obj]=value
            return 1
        if root=='tag':
            for p in self.select(a[1],actor):
                if a[2]=='add':p.tags.add(a[3])
                elif a[2]=='remove':p.tags.discard(a[3])
                else:raise AssertionError(line)
            return 1
        if root=='attribute':
            for p in self.select(a[1],actor):p.attributes[a[2].removeprefix('minecraft:')]=float(a[5])
            return 1
        if root=='gamerule':
            if len(a)==2:return int(self.rules.get(a[1],False))
            self.rules[a[1]]=a[2]=='true';return 1
        if root=='gamemode':
            for p in self.select(a[2],actor):p.mode=a[1]
            return 1
        if root=='team':
            if a[1] in ('leave','join'):
                for p in self.select(a[2] if a[1]=='leave' else a[3],actor):p.team=None if a[1]=='leave' else a[2]
            return 1
        if root=='schedule':
            if a[1]=='clear':self.scheduled.discard(a[2])
            else:self.scheduled.add(a[2])
            return 1
        if root=='kill':
            for entity in self.select(a[1],actor):
                if entity in self.entities:self.entities.remove(entity)
            return 1
        if root=='tellraw':self.notices.append(line);return 1
        if root in {'clear','effect','item','title','playsound','particle','kill','weather','advancement','experience','data','time','tp','spawnpoint','bossbar','give','spreadplayers'}:return 1
        raise AssertionError('Unsupported command in state-flow runner: '+line)
    def execute(self,a,actor):
        contexts=[actor];i=0;store=None
        while i<len(a):
            part=a[i]
            if part=='run':
                result=0
                for ctx in contexts:result=self.command(' '.join(a[i+1:]),ctx) or 0
                if store and contexts:self.set(store[0],store[1],result,contexts[0])
                return result
            if part=='as':contexts=[p for ctx in contexts for p in self.select(a[i+1],ctx)];i+=2;continue
            if part=='at':contexts=[ctx for ctx in contexts if self.select(a[i+1],ctx)];i+=2;continue
            if part=='store':
                if a[i+1:i+3]==['result','score']:
                    store=(a[i+3],a[i+4]);i+=5;continue
                if a[i+1:i+3]==['result','storage']:
                    i+=7;continue  # Item UI storage is outside this runner's state model.
                if a[i+1:i+3]==['result','bossbar']:
                    i+=5;continue
                raise AssertionError('Unsupported store: '+' '.join(a[i:]))
            if part not in ('if','unless'):raise AssertionError('Unsupported execute: '+' '.join(a[i:]))
            invert=part=='unless';kind=a[i+1]
            if kind=='entity':
                token=a[i+2];contexts=[ctx for ctx in contexts if bool(self.select(token,ctx))!=invert];i+=3
            elif kind=='score':
                target,obj,op=a[i+2:i+5]
                if op=='matches':
                    ran=a[i+5];contexts=[ctx for ctx in contexts if ((v:=self.get(target,obj,ctx)) is not None and self.matches(v,ran))!=invert];i+=6
                else:
                    rhs,robj=a[i+5:i+7]
                    def condition(ctx):
                        l=self.get(target,obj,ctx);r=self.get(rhs,robj,ctx)
                        if l is None or r is None:return False
                        return {'=':l==r,'>':l>r,'<':l<r,'>=':l>=r,'<=':l<=r}[op]
                    contexts=[ctx for ctx in contexts if condition(ctx)!=invert];i+=7
            elif kind=='items':
                # These scenarios intentionally have empty inventory; visual cleanup is a stand-in.
                contexts=contexts if invert else [];i+=6
            else:raise AssertionError('Unsupported predicate: '+' '.join(a[i:]))
        return 0
