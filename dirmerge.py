#!/usr/bin/python3

import sys
import os
import pathlib

#print(sys.argv)

def main():
    if len(sys.argv) < 3:
        print(f'Expected:\n\t{sys.argv[0]} <to_dir> <from_dir_1> [... <from_dir_2>]')
        return
    to = sys.argv[1]
    fro = sys.argv[2:]
    pathlib.Path(to).mkdir(parents=True, exist_ok=True)

    have = set()
    for fname in os.listdir(to):
        have.add(fname)
    want = set()
    for folder in fro:
         for fname in os.listdir(folder):
            if fname == '.DS_Store':
                continue
            want.add(fname)
    for fname in have:
        if not fname in want:
            print(f'rm {to}/{fname}')
    for one in have:
        if one in want:
            want.remove(one)
    for folder in fro:
         for fname in os.listdir(folder):
            if not fname in want:
                continue
            print(f'cp {folder}/{fname} {to}/')

if __name__ == '__main__':
    main()
