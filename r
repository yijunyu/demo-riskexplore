#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
#filename=$(dirname $1)/composed
filename=$1-symbolic
params=
param_pms=
consts=
for INPUT in $*; do
	if [ "${INPUT/examples/}" != "${INPUT}" ]; then
		echo $INPUT
		values=$(grep const $INPUT.pm | grep -v "=" | sed 's/const double /-const /g' | sed 's/;.*/=0.1/g' | tr '\n' ' ')
		n=$(grep const $INPUT.pm | grep -v "=" | grep "const double i" | wc -l)
		for i in $(seq 1 $n); do
			if [ "$i" != "1" ]; then
				const="$const ,0.1"
			else
				const="0.1"
			fi
		done
		echo $prism $INPUT.pm -exportmodel $INPUT.all $values
		if [ ${INPUT/-symbolic/} == "$INPUT" ]; then
			if [ ! -f $INPUT-symbolic.pm ]; then
				cp $INPUT.pm $INPUT-symbolic.pm
				$prism $INPUT-symbolic.pm -exportmodel $INPUT-symbolic.all $values
			fi
			#awk -f tra.awk $INPUT-symbolic.pm > $INPUT-symbolic.tra 
			#awk -f srew.awk $INPUT-symbolic.pm > $INPUT-symbolic.srew 
		fi
		params="$params $INPUT-symbolic"
		param_pms="$param_pms $INPUT-symbolic.pm"
	else
		consts=$consts $INPUT
	fi
	echo $const
done
echo $param_pms
# CLI 
# numeric
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -n -g $INPUT
# symbolic
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -g $INPUT-symbolic

# symbolic composition of the model and itself two more times
java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -g $params

# GUI
#java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Graph -g $INPUT
#cat $param_pms > $filename.pm
echo $const
if [ -f $filename.risks ]; then
	  awk -f risks.awk -v file=$filename -v CONST=",$const" $filename.risks > $filename.rpf
	  rscript $filename.rpf | awk -f rpf.awk 
fi
