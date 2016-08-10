#!/bin/bash
eval $(docker-machine env default)
export docker="docker-machine ssh default docker"
docker-machine scp Dockerfile default:
$docker build -t jdk7 .
