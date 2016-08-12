#!/bin/bash
pat="s#PWD#${PWD}#g"
sed -e "$pat" > rgen <<EOF
#!/bin/sh
docker build -t jdk7 .
docker run -i -v PWD/.m2:/root/.m2 -v PWD/riskexplore:/riskexplore -v PWD/yacas:/yacas jdk7 bash -c "cd /yacas && ant jar && mvn install:install-file -Dfile=./dist/lib/yacas.jar -DgroupId=yacas -DartifactId=yacas -Dversion=1.5.0 -Dpackaging=jar -DlocalRepositoryPath=/root/.m2/repository"
docker run -i -v PWD/.m2:/root/.m2 -v PWD/riskexplore:/riskexplore -v PWD/yacas:/yacas jdk7 bash -c "cd /riskexplore && mvn install"
EOF
chmod +x rgen
case $(uname) in
Linux)
	export docker=docker
	./rgen
	;;
*)
	eval $(docker-machine env default)
	export docker="docker-machine ssh default docker"
	docker-machine scp Dockerfile default:
	docker-machine scp rgen default:
	docker-machine ssh default -t ./rgen
	;;
esac
