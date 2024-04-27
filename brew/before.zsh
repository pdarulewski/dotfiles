#!/usr/bin/env zsh

xcode-select --install

print_green "Checking if Homebrew is already installed..."

print_green "Installing Homebrew."
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

print_green "Updating and upgrading Homebrew..."
yes | brew update
yes | brew upgrade

brew install zsh
brew install zsh-completions
brew install romkatv/powerlevel10k/powerlevel10k

brew install btop
brew install wget
brew install jq
brew install git
brew install git-lfs
brew install gh
brew install gnupg
brew install lazygit
brew install tmux

brew install neofetch

brew install fd
brew install ripgrep
brew install tree
brew install bat
brew install fzf

brew install neovim

brew install kubectl
brew install kubectx
brew install k9s

brew install azure-cli

brew install poetry
brew install pyenv
brew install go
brew install node
brew install rustup-init

brew install postgresql
brew install redis

brew install xcode-build-server
brew install xcbeautify
brew install xcodegen
brew install swiftlint
brew install swiftformat

brew install --cask kitty
brew install --cask rectangle
brew install --cask spotify
brew install --cask arc
brew install --cask docker

brew install spicetify/homebrew-tap/spicetify-cli
brew tap homebrew/cask-fonts
brew install font-symbols-only-nerd-font
brew install font-iosevka-nerd-font
brew install font-fira-code
brew install font-victor-mono

print_green "Remove outdated versions from the cellar"
brew cleanup
