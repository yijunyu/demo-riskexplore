#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
if [ "$1" == "-g" ]; then
	INPUT=$2
else
	INPUT=$1
fi
echo $INPUT
if [ ! -f $INPUT.tra ]; then
  $prism $INPUT.pm -exportmodel $INPUT.all -const p=0.9
fi

# CLI 
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -g $INPUT

# GUI
java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Graph -g $INPUT
