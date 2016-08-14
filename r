#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
INPUT=$1
if [ ! -f $INPUT.tra ]; then
  $prism $INPUT.pm -exportmodel $INPUT.all -const p=0.5 -exportss $INPUT.ss -ss
fi

# CLI 
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search $1

# GUI
java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Graph $1
