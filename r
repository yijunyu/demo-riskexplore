docker run -it -v ${PWD}/.m2:/root/.m2 -v ${PWD}/riskexplore:/riskexplore -v ${PWD}/yacas:/yacas jdk7 bash -c "cd /yacas && ant jar"
docker run -it -v ${PWD}/.m2:/root/.m2 -v ${PWD}/riskexplore:/riskexplore -v ${PWD}/yacas:/yacas jdk7 bash -c "cd /riskexplore && make"
docker run -it -v ${PWD}/.m2:/root/.m2 -v ${PWD}/riskexplore:/riskexplore -v ${PWD}/yacas:/yacas jdk7 bash
