#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
INPUT=$1
if [ ! -f $INPUT.tra ]; then
  $prism $INPUT.pm -exportmodel $INPUT.all -const p=0.5 -exportss $INPUT.ss -ss
fi
java -cp riskexplore/target/riskexplore-1.0.jar uk.ac.open.riskexplore.Search $1
