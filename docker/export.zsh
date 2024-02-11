#!/usr/bin/env zsh

function drun() {
	docker run --rm -it --entrypoint /bin/bash $1
}
