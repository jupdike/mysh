#!/Users/jupdike/pyvenv/bin/python3

import sys

print(sys.argv)

if len(sys.argv) <2:
    print("Usage: python srt-to-txt.py <file_path>")
    sys.exit(1)

file_path = sys.argv[1]

with open(file_path, 'r') as f:
    lines = f.readlines()

outs = []
last = None
for i, line in enumerate(lines):
    if i % 4 == 2:
        one = line.strip()
        if one != last:
            outs.append(one)
        last = one

print(' '.join(outs))
