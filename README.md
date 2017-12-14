# URBril

just a bunch of useful scripts to get the integrated luminosity from URAnalysis ntuples output. Once bril commands will become avaliable outside lxplus should be integrated into URAnalysis

## Installlation

works **only** on lxplus, as any other bril command, as far as I know.

```
git clone https://github.com/urcms/URBril
cd URBril
source env.sh
```

## Content

 * ```compute_lumi_2016.sh```: Usage copy all the ```.run.json``` files in your inputs directory and then run ```bash < compute_lumi_2016.sh```, computes the lumi for all the files present, including the total pileup profile with systematics. Copy back all the ```.lumi``` and ```.root``` files
 * ```clear.sh```: Usage ```bash < clear.sh```, removes all the input, output and temporary files in the directory
 * ```split.py```: splits a json into a before and after json, depending on the run passed as input
 * ```split_by_run.sh```: To be run after ```compute_lumi_2016.sh```, splits the full sample into single runs, then computes the lumi recorded for each run and dumps a ```.lumi``` file. 


