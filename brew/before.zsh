#!/usr/bin/env zsh

print_green "Installing Homebrew."
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

print_green "Updating and upgrading Homebrew..."
yes | brew update
yes | brew upgrade

# core
brew install zsh

brew install bat
brew install btop
brew install fd
brew install fzf
brew install git
brew install gnupg
brew install jq
brew install ripgrep
brew install tmux
brew install tree
brew install wget

# basic
brew install gh
brew install git-lfs
brew install lazydocker
brew install lazygit
brew install neovim

# dev
brew install poetry
brew install pyenv
brew install go
brew install golangci-lint
brew install node
brew install ruby
brew install rustup-init
brew install pre-commit

# bonus
brew install neofetch

# kubernetes
brew install kubectl
brew install kubectx
brew install k9s

# azure
# brew install azure-cli

# xcode
# brew install xcode-build-server
# brew install xcbeautify
# brew install xcodegen
# brew install swiftlint
# brew install swiftformat

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
