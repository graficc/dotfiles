#!/bin/bash

rm -rf ~/.cache/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.config/nvim/lua/packer_compiled.lua

git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/opt/packer.nvim
git clone --depth 1 https://github.com/lewis6991/impatient.nvim ~/.local/share/nvim/site/pack/packer/opt/impatient.nvim

