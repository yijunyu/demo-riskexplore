#!/bin/bash
prism=${PWD}/prism/prism/bin/prism
function measure() {
	INPUT=examples/$1
	shift
	echo PRISM $INPUT
	/usr/bin/time $prism $INPUT.pm -exportmodel $INPUT.all -const $* > /dev/null
	echo Simulation $INPUT
	/usr/bin/time java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -s $INPUT > /dev/null
	echo Numeric $INPUT
	/usr/bin/time java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search -n $INPUT > /dev/null
	echo Symbolic $INPUT
	/usr/bin/time java -cp .m2/repository/uk/ac/open/riskexplore/1.0/riskexplore-1.0.jar uk.ac.open.riskexplore.Search $INPUT-symbolic > /dev/null
}
measure PIN p=0.9
measure em2 p01=0.4 p02=0.4 p03=0.19 p13=0.8 p23=0.5 p25=0.1 p30=0.2 p31=0.3 p32=0.3 p56=0.25 p67=0.7 p73=1 p80=0.9 p98=0.35 p910=0.6 p1011=0.2 p114=1
