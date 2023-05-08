alias s='source venv/bin/activate'
alias p='poetry shell'
alias icat='imgcat.sh'
alias l='colorls -lAh --sd'
alias ghpr='gh pr create'
alias diff='diff --side-by-side -W $(( $(tput cols) - 2 ))'

function nvim_with_poetry() {
  source "$(poetry env info --path)/bin/activate"
  nvim $*;
  deactivate;
}

function nvim_with_venv() {
  source venv/bin/activate
  nvim $*;
  deactivate;
}

function poetry_activate() {
  if [ -e pyproject.toml ]; then
    if poetry env info --path &> /dev/null; then
      nvim_with_poetry

    elif [ -e venv/ ]; then
      nvim_with_venv

    else
      nvim

    fi

  elif [ -e venv/ ]; then
      nvim_with_venv

  else
    nvim

  fi
}

alias nvim='poetry_activate'
