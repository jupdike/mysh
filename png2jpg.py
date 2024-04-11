#!/usr/bin/python3

import sys

def main():
  inputs = sys.argv[1:]
  #print(inputs)
  for file in inputs:
    print(f'convert {file} -auto-orient -quality 91 {file.replace(".png", ".jpg")}')

if __name__ == '__main__':
  main()
