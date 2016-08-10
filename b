#!/bin/bash
eval $(docker-machine env default)
docker=docker-machine ssh default docker
docker build -t jdk7 .
