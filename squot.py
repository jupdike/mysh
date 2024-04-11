#!/Users/jupdike/anaconda2/bin/python

import sys

for line in sys.stdin:
    line = line.rstrip()
    line = ' '.join(sys.argv[1:]) + ' ' + "'" + line + "'"
    print line
