#!/usr/bin/env python

# Lists all original absolute root paths of a tar archive
# Usage:
# tar tf archive.tar | python tarpaths.py
# or
# tar tcf archive.tar.gz | python tarpaths.py

import sys

result = []

def comparelines(old, new):
    if len(old) <= len(new):
        if  new.startswith(old):
            return True
    else:
        if old.startswith(new):
            result[result.index(old)] = new
            return True
    return False

def checkline(line):
    if len(result) == 0:
        result.append(line)
    else:
        newEntry = True
        for entry in result:
            if comparelines(entry, line):
                newEntry = False
                break
        if newEntry:
            result.append(line)

for line in sys.stdin:
    checkline(line.rstrip())

for entry in result:
    print "/" + entry + "*"
