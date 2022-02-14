#!/bin/bash

# install.sh
# symlink dotfiles to the appropriate places

#Get dotfiles installation directory
DOTFILES_DIR=$(pwd)


DOTFILES=(
	".bashrc"
	".config"
	".gitconfig"
	".gitignore"
	".xinitrc"
	".xprofile"
	".zshenv"
	".zshrc"
	".config/env"
	".config/i3/autostart.sh"
	".config/i3/config"
	".config/polybar/config"
	".cpnfig/polybar/launch.sh"
	".config/termite/config"
	".vim/vimrc"
)

for dotfile in "${DOTFILES[@]};do
	ln -sf "${DOTFILES_DIR}/${dotfile} "${HOME}/${dotfile}
done
