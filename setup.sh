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
      if [ -f $1 ];then
        mv $1 $OLD_DOTFILES
        echo "backup $1"
      fi

      if [ -d $1 ]; then
        mv $1 $OLD_DOTFILES
        echo "backup $1"
      fi
  }

  # Clean common conflicts
  backup_if_exists $HOME/.bash_profile
  backup_if_exists $HOME/.bashrc
  backup_if_exists $HOME/.zshrc
  backup_if_exists $HOME/.gitconfig
  backup_if_exists $HOME/.gitignore_global
  backup_if_exists $HOME/.dotfiles
  backup_if_exists $HOME/.tmux
  backup_if_exists $HOME/.tmux.conf
  backup_if_exists $HOME/.profile

  # soft link
  DOTFILES="$(dirname $(realpath $0))"
  echo "DOTFILES=${DOTFILES}"

  ln -s $DOTFILES $HOME/.dotfiles

  ln -s $DOTFILES/.bashrc  $HOME/.bashrc
  ln -s $DOTFILES/.zshrc $HOME/.zshrc

  ln -s $DOTFILES/git/.gitignore_global $HOME/.gitignore_global
  ln -s $DOTFILES/.gitconfig $HOME/.gitconfig

  # ln -s $DOTFILES/.tmux $HOME/.tmux
  ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf

