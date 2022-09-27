#!/bin/bash 
set -o nounset
set -o errexit
set -o pipefail

# Get current path
cwd=$(pwd)

# Move to home
cd $HOME

# Create a bkp folder
n=""
while [ -d vimrc_bkp$n ]
do
	((++n))
done
mkdir vimrc_bkp$n 

# Move files to bkp
[[ -L ".vimrc" ||  -e ".vimrc" ]] && mv .vimrc vimrc_bkp$n
[[ -L ".vim" ||  -d ".vim" ]] && mv .vim vimrc_bkp$n

# Link new configuration files
ln -s "$cwd/vimrc" ".vimrc"
ln -s "$cwd/vim" ".vim"

