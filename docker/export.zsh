#!/usr/bin/env zsh

export DOCKER_DEFAULT_PLATFORM=linux/amd64
function drun() {
  docker run --rm -it --entrypoint /bin/sh $1
}
