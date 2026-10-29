"""Loopback-only RCON client for an explicitly created IslandEscape sandbox."""
from pathlib import Path
import argparse, json, socket, struct

class Rcon:
    def __init__(self, sandbox):
        self.root = Path(sandbox).resolve()
        cfg = json.loads((self.root / 'sandbox.json').read_text(encoding='utf-8'))
        if Path(cfg['root']).resolve() != self.root:
            raise ValueError('Sandbox manifest/root mismatch')
        self.connection = socket.create_connection(('127.0.0.1', int(cfg['rcon_port'])), timeout=15)
        self.connection.settimeout(20); self.sequence = 1
        self.send(1, 3, cfg['rcon_password'])
        while True:
            request, kind, payload = self.receive()
            if request == -1: raise PermissionError('RCON authentication rejected')
            if kind == 2: break
    def send(self, request, kind, text):
        payload = struct.pack('<ii', request, kind) + text.encode('utf-8') + b'\0\0'
        self.connection.sendall(struct.pack('<i', len(payload)) + payload)
    def read_exact(self, size):
        data = bytearray()
        while len(data) < size:
            block = self.connection.recv(size-len(data))
            if not block: raise ConnectionError('RCON disconnected')
            data.extend(block)
        return bytes(data)
    def receive(self):
        size = struct.unpack('<i', self.read_exact(4))[0]
        if not 10 <= size <= 2**20: raise ValueError('Invalid RCON packet size')
        data = self.read_exact(size)
        return *struct.unpack('<ii',data[:8]), data[8:-2].decode('utf-8',errors='replace')
    def command(self, text):
        self.sequence += 2; request = self.sequence; marker = request+1
        self.send(request, 2, text)
        first_reply, kind, first_payload = self.receive()
        if first_reply != request: raise ValueError('Unexpected command response id')
        parts=[first_payload]
        # Wait for the first reply before issuing the marker: Minecraft RCON is not a pipelined protocol.
        self.send(marker, 2, 'list')
        while True:
            reply, kind, payload = self.receive()
            if reply == marker: break
            if reply == request: parts.append(payload)
        response=''.join(parts)
        with (self.root/'commands.jsonl').open('a',encoding='utf-8') as log:
            log.write(json.dumps({'command':text,'response':response},ensure_ascii=False)+'\n')
        return response
    def close(self): self.connection.close()
    def __enter__(self): return self
    def __exit__(self,*args): self.close()

def main():
    parser=argparse.ArgumentParser();parser.add_argument('--sandbox',type=Path,required=True);parser.add_argument('command',nargs='+');args=parser.parse_args()
    with Rcon(args.sandbox) as rcon:
        for command in args.command: print(command+'\n'+rcon.command(command))
if __name__=='__main__':main()
