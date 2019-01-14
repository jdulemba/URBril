
for i in $(ls data_*.run.json); do
		filename=$(basename "$i")
		name="${filename%.*}"
		name="${name%.*}"
		echo "analyzing $name"
		#brilcalc lumi  --normtag /afs/cern.ch/user/l/lumipro/public/Normtags/normtag_DATACERT.json -i $i > $name.out
		brilcalc lumi -c web --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -i $i > $name.out
		./parse_bril_out.py $name.out > $name.lumi
done

#echo " -- PILEUP -- "
#cmsenv
#mergeJSON.py data_*.run.json  --output=data_all.json
#pileupCalc.py -i data_all.json --inputLumiJSON /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions16/13TeV/PileUp/pileup_latest.txt --calcMode true --minBiasXsec 69000 --maxPileupBin 100 --numPileupBins 100 data.meta.pu.root
#
#pileupCalc.py -i data_all.json --inputLumiJSON /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions16/13TeV/PileUp/pileup_latest.txt --calcMode true --minBiasXsec 72450 --maxPileupBin 100 --numPileupBins 100 data.meta.pu_up.root
#
#pileupCalc.py -i data_all.json --inputLumiJSON /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions16/13TeV/PileUp/pileup_latest.txt --calcMode true --minBiasXsec 65550 --maxPileupBin 100 --numPileupBins 100 data.meta.pu_down.root
