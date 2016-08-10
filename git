#!/bin/bash
function clone () {
	url=$2
	repo=$(basename $url)
	mkdir -p $repo
	docker run -v $(pwd)/$repo:/$repo -it pandoc git $*
}
repo=$(basename ${PWD})
echo docker run -v $(pwd)/../$repo:/$repo -it pandoc git $*
docker run -v $(pwd)/../$repo:/$repo -it pandoc bash -c "cd $repo && git $*"
