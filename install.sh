#!/bin/bash

#Get dotfiles installation directory
DOTFILES_DIR=$(pwd)

ln -sf "DOTFILES_DIR/.bash_profile" ~
ln -sf "DOTFILES_DIR/.bashrc" ~
ln -sf "DOTFILES_DIR/.gitconfig" ~
ln -sf "DOTFILES_DIR/.p10k.zsh" ~
ln -sf "DOTFILES_DIR/.vim" ~
ln -sf "DOTFILES_DIR/.vimrc" ~
ln -sf "DOTFILES_DIR/.zshrc" ~
