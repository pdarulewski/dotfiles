#!/usr/bin/env zsh

function envir() {
  [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
}
