
mkdir byrun
while read line; do
		new_line=`echo $line | sed 's/{//g' | sed 's/}//g'` ## | sed 's/,//g'`
		runno=`echo $new_line | awk -F'"' '{print $2}'`
		echo $runno"   ""{"$new_line'}'
		echo "{"$new_line'}' > byrun/$runno.json
		brilcalc lumi  --normtag /afs/cern.ch/user/c/cmsbril/public/normtag_json/OfflineNormtagV1.json  -i byrun/$runno.json > byrun/$runno.out
		./parse_bril_out.py byrun/$runno.out > byrun/$runno.lumi
done < data_all.json

