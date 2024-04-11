#!/bin/sh

(cd /Users/jupdike/Documents/dev/chordata/src/notes && cat *.md | sed -e 's/<[^>]*>/ /g' | wc)
