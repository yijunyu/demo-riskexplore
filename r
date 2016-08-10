#!/bin/bash
pat="s#PWD#${PWD}#g"
sed -e "$pat" > rgen <<EOF
#!/bin/sh
docker run -i -v PWD/.m2:/root/.m2 -v PWD/riskexplore:/riskexplore -v PWD/yacas:/yacas jdk7 bash -c "cd /yacas && ant jar"
docker run -i -v PWD/.m2:/root/.m2 -v PWD/riskexplore:/riskexplore -v PWD/yacas:/yacas jdk7 bash -c "cd /riskexplore && make"
docker run -it -v PWD/.m2:/root/.m2 -v PWD/riskexplore:/riskexplore -v PWD/yacas:/yacas jdk7 bash
EOF
chmod +x rgen
docker-machine scp rgen default:
docker-machine ssh default ./rgen
