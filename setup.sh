#!/usr/bin/env bash

# set -e          # Exit on error
# set -o pipefail # Exit on pipe error
# set -x          # Enable verbosity

git submodule update --init --recursive

# PROGRAMS=(alias bash env git python scripts stow tmux vim zsh)
# PROGRAMS=(alias aspell bash env git latex python scripts stow tmux vim zsh mac terminal)
  OLD_DOTFILES="dotfiles_bk_$(date -u +"%Y%m%d%H%M%S")"
  mkdir $OLD_DOTFILES

  function backup_if_exists() {
      if [ -f $1 ];
      then
        mv $1 $OLD_DOTFILES
        echo "backup $1"
      fi
      if [ -d $1 ];
      then
        mv $1 $OLD_DOTFILES
        echo "backup $1"
      fi
  }

  # Clean common conflicts
  backup_if_exists ~/.bash_profile
  backup_if_exists $HOME/.bashrc
  backup_if_exists $HOME/.zshrc
  backup_if_exists $HOME/.gitconfig
  backup_if_exists $HOME/.dotfiles
  backup_if_exists ~/.tmux.conf
  backup_if_exists ~/.profile


  # soft link
  DOTFILES="$(dirname $(realpath $0))"
  echo "DOTFILES=${DOTFILES}"

  ln -s $DOTFILES $HOME/.dotfiles

  ln -s $DOTFILES/.bashrc  ~/.bashrc
  ln -s $DOTFILES/.gitconfig ~/.gitconfig
  ln -s $DOTFILES/.zshrc ~/.zshrc


