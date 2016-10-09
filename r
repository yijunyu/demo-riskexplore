#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
if [ "$1" == "-g" ]; then
	INPUT=$2
else
	INPUT=$1
fi
echo $INPUT
if [ ! -f $INPUT.tra ]; then
	values=$(grep const $INPUT.pm | sed 's/const double /-const /g' | sed 's/;.*/=0.1/g' | tr '\n' ' ')
	echo $prism $INPUT.pm -exportmodel $INPUT.all $values
	$prism $INPUT.pm -exportmodel $INPUT.all $values
fi
if [ ! -f $INPUT-symbolic.risks ]; then
	  cp $INPUT.pm $INPUT-symbolic.pm
	  awk -f tra.awk $INPUT.pm > $INPUT-symbolic.tra 
	  awk -f srew.awk $INPUT.pm > $INPUT-symbolic.srew 
fi

# CLI 
# numeric
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -n -g $INPUT
# symbolic
java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -g $INPUT

# GUI
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Graph -g $INPUT

