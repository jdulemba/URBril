export LD_LIBRARY_PATH=/afs/cern.ch/cms/lumi/brilconda-1.1.7/root/lib
export PYTHONPATH=/afs/cern.ch/cms/lumi/brilconda-1.1.7/root/lib
export PYTHONPATH=$ROOTSYS/lib:$PYTHONPATH
export ROOTSYS=/afs/cern.ch/cms/lumi/brilconda-1.1.7/root
export PATH=$HOME/.local/bin:/afs/cern.ch/cms/lumi/brilconda-1.1.7/bin:$PATH
pip uninstall brilws  -y
pip install --install-option="--prefix=$HOME/.local" brilws
#cmsenv
#export PATH=$HOME/.local/bin:/afs/cern.ch/cms/lumi/brilconda-1.0.3/bin:$PATH
#alias clean_lumi='rm *.run.json *.out *.lumi *.pu.root'