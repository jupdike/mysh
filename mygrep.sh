#!/bin/sh
# usage: mygrep.sh '*.md' 'mystr' [more grep args...]
ext=$1
shift
grep -Firn --color=auto --include="$ext" "$@" .
