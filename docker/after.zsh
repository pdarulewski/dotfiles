#!/usr/bin/env zsh

curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose >$HOME/.zsh/completion/_docker-compose
curl -L https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker >$HOME/.zsh/completion/_docker
