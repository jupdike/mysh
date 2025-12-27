#/bin/sh

# see https://fontforge.org/docs/scripting/python.html#python-extension
#
# fontforge will prepend
#   from sys import argv; from fontforge import *
/opt/homebrew/bin/fontforge -c 'open(argv[1]).generate(argv[2])' $1 $2
