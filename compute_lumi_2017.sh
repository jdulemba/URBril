
for i in $(ls data_*.run.json); do
		filename=$(basename "$i")
		name="${filename%.*}"
		name="${name%.*}"
		echo "analyzing $name"
		#brilcalc lumi  --normtag /afs/cern.ch/user/l/lumipro/public/Normtags/normtag_DATACERT.json -i $i > $name.out
		brilcalc lumi -c web --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -i $i > $name.out
		#brilcalc lumi -i $i > $name.out
		./parse_bril_out.py $name.out > $name.lumi

		### find lumi for trigger during same run
		#trig="HLT_IsoTkMu24"
		#brilcalc lumi -i $i --hltpath "HLT_IsoTkMu24_v*" > "${trig}_${name}.out"
		#./parse_bril_out.py "${trig}_${name}.out" > "${trig}_${name}.lumi"
done

