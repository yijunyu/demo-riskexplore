#!/bin/bash
case $(uname) in
Linux)
	export docker=docker
	;;
*)
	eval $(docker-machine env default)
	export docker="docker-machine ssh default docker"
	docker-machine scp Dockerfile default:
	;;
esac
$docker build -t jdk7 .
