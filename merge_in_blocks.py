import os
import glob

chunksize=100
lumifiles = glob.glob('byrun/*.lumi')
lumis = []
for fname in lumifiles:
   runno = int(
      os.path.basename(fname).split('.')[0]
      )
   lumi = float(open(fname).read())
   lumis.append((runno, lumi))

lumis.sort(key=lambda x: x[0], reverse=True)

chunks=[]
lumi_sum=0
run_start=None
while lumis:
   run, lumi = lumis.pop()
   if not run_start:
      run_start=run
      lumi_sum=lumi
   if (lumi_sum+lumi) > chunksize:
      print "[%d, %d] --> %.3f" % (run_start, run, (lumi_sum+lumi))
      lumi_sum=0
      run_start=None
   else:
      lumi_sum+=lumi

print "[%s, %s] --> %.3f"% (run_start, run, (lumi_sum+lumi))
