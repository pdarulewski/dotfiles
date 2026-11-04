#!/usr/bin/env zsh

function chpwd_do_ls() {
  l
}

function dev() {
  if [[ -f flake.nix ]] && [[ -z "$IN_NIX_SHELL" ]]; then
    nix develop --command zsh
  fi
}

function envir() {
  [ ! -f .env ] || export $(grep -v '^#' .env | xargs)
}

function s() {
  if [[ -d .venv ]]; then
    source .venv/bin/activate
  fi
}

function nvmu() {
  if [[ -f .nvmrc ]]; then
    nvm use
  fi
}

chpwd_functions=(
  chpwd_do_ls
  dev
  s
  envir
  nvmu
)
