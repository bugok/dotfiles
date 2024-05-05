#/usr/bin/env bash
set -e 

function copy_file () 
{
    local src="${1:?}"
    local dst="${2:?}"

    echo "Copying ${src} to ${dst}"
}

function err ()
{
    echo "$1"
    exit 1
}

cur_basename=$(basename $PWD)
if [[ $cur_basename != "dotfiles" ]]; then
    err "$0 needs to run from the dotfiles directory"
fi

copy_file bash_profile $HOME/.bash_profile
copy_file hgrc $HOME/.hgrc
copy_file inputrc $HOME/.inputrc
copy_file ssh_config $HOME/.ssh/config
copy_file vimrc $HOME/.vimrc
copy_file gitconfig $HOME/.gitconfig

name=$(uname)
if [[ $name == 'Darwin' ]]; then
  echo "On MacOS. Doing MacOS specific stuff"
  
  copy_file DefaultKeyBinding.dict $HOME/Library/KeyBindings/DefaultKeyBinding.dict

fi

