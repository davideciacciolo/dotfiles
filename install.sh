#!/bin/bash

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim"

mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotifles/zsh/.zshrc" "$HOME/.config/zsh"

