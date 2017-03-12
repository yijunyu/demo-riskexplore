#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
if [ "$1" == "-g" ]; then
	INPUT=$2
else
	INPUT=$1
fi
echo $INPUT
values=$(grep const $INPUT.pm | grep -v "=" | sed 's/const double /-const /g' | sed 's/;.*/=0.1/g' | tr '\n' ' ')
echo $prism $INPUT.pm -exportmodel $INPUT.all $values
if [ ${INPUT/-symbolic/} == "$INPUT" ]; then
	cp $INPUT.pm $INPUT-symbolic.pm
	$prism $INPUT-symbolic.pm -exportmodel $INPUT-symbolic.all $values
	cp $INPUT-symbolic.risks $INPUT.risks
	cp $INPUT-symbolic.det $INPUT.det
	cp $INPUT-symbolic.tra $INPUT.tra
	cp $INPUT-symbolic.srew $INPUT.srew
	awk -f tra.awk $INPUT-symbolic.pm > $INPUT-symbolic.tra 
	awk -f srew.awk $INPUT-symbolic.pm > $INPUT-symbolic.srew 
fi
# CLI 
# numeric
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -n -g $INPUT
# symbolic
java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -g $INPUT-symbolic

# symbolic composition of the model and itself
java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search $INPUT-symbolic $INPUT-symbolic

# GUI
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Graph -g $INPUT

#exit 0
shift 
const=$(echo $* | sed 's/ /,/g')
if [ -f $INPUT-symbolic.risks ]; then
	  awk -f risks.awk -v file=$INPUT-symbolic -v CONST=",$const" $INPUT-symbolic.risks > $INPUT-symbolic.rpf
	  rscript $INPUT-symbolic.rpf | awk -f rpf.awk 
fi
