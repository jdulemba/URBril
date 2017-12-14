#! /bin/env python

import os, sys
from pdb import set_trace

fname = sys.argv[-1]
with open(fname) as fin:
   parse = False
   skip = -4 #skip first four lines of summary
   for line in fin:
      if line.startswith("#Summary:"):
         parse = True
      if parse:
         skip += 1
      if skip > 0:
         lumi = float(line.split()[-2])
         print lumi*10**-6
         sys.exit(0)
