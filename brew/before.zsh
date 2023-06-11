#!/usr/bin/env zsh

xcode-select --install

print_green "Checking if Homebrew is already installed..."

print_green "Installing Homebrew.";
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

print_green "Updating and upgrading Homebrew..."
yes | brew update
yes | brew upgrade

brew install git
brew install gh
brew install gnupg
brew install lazygit

brew install ripgrep
brew install tree
brew install fzf

brew install neovim
brew install neofetch

brew install zsh
brew install zsh-completions
brew install romkatv/powerlevel10k/powerlevel10k

brew install spicetify/homebrew-tap/spicetify-cli

brew install python@3.11
brew install go
brew install node
brew install ruby

brew install --cask kitty
brew install --cask rectangle
brew install --cask spotify

brew tap homebrew/cask-fonts
brew install font-symbols-only-nerd-font
brew install font-iosevka-nerd-font
brew install font-fira-code
brew install font-victor-mono

print_green "Remove outdated versions from the cellar"
brew cleanup
