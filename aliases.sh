alias s='source venv/bin/activate'
alias p='poetry shell'
alias icat='imgcat.sh'
alias l='colorls -lAh --sd'
alias ghpr='gh pr create'
alias diff='diff -W $(( $(tput cols) - 2 ))'

function poetry_activate() {
  if [ -e pyproject.toml ]; then
    if ! command -v poetry &> /dev/null; then
      echo "Poetry is not installed. Please install it before running this command."
      return 1
    fi

    if poetry env info --path &> /dev/null; then
      source "$(poetry env info --path)/bin/activate"
      nvim $*;
      deactivate;
    fi
  else
    nvim
  fi
}
alias nvim='poetry_activate'
