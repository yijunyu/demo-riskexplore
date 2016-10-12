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
#measure PIN p=0.9
#measure ads pfree=0.4 pbanner=0.4 pinterstitial=0.19 Premium=1.99 Impression=0.01 Click=0.10
#measure privacy pseen=0.1 pignore=0.1 pjk=0.1 puc=0.1 pfc=0.1 pfl=0.1 preply=0.1 pagain=0.1 r1=1 r3=1 r4=1 r5=1 r6=1 r7=1
measure em2 p01=0.4 p02=0.4 p03=0.19 p13=0.8 p23=0.5 p25=0.1 p30=0.2 p31=0.3 p32=0.3 p56=0.25 p67=0.7 p73=1 p80=0.9 p98=0.35 p910=0.6 p1011=0.2 p114=1
#/usr/bin/time r examples/PIN 0 1
#/usr/bin/time r examples/em2 3 3 3
#/usr/bin/time r examples/ads 1.99 0.01 0.10
#/usr/bin/time r examples/privacy 1 1 1 1 1 1
