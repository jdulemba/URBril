
for i in $(ls data_*.final_run.json); do
		filename=$(basename "$i")
		name="${filename%.*}"
		name="${name%.*}"
		echo "analyzing $name"
		#brilcalc lumi  --normtag /afs/cern.ch/user/l/lumipro/public/Normtags/normtag_DATACERT.json -i $i > $name.out
		brilcalc lumi -c web --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -i $i > $name.out
		./parse_bril_out.py $name.out > $name.lumi
done
