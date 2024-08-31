* [Dotfiles](#dotfiles)
  * [Setup](#setup)
  * [describe](#describe)
    * [zsh \&\& plugins](#zsh--plugins)
    * [tools](#tools)
    * [gitconfig](#gitconfig)
    * [cargo](#cargo)
    * [tmux \&\& plugins](#tmux--plugins)

# Dotfiles

my dotfiles for Unbuntu or Debian about zsh && tools && gitconfig.

## Setup

```bash
git clone <repository_url> /your/path
source /your/path/setup.sh

tmux
prefix + I # install tmux plugins
```

## describe

setup.sh will backup your dotfiles in the same directory.

### zsh && plugins

**powerlevel10k**

  A zsh theme. Don't forget to install recommended fonts.

**zsh-autosuggestions**
**zsh-syntax-highlighting**
**zsh-you-should-use**
**fzf-tab**

### tools

**delta**

**exa**

**procs**

**tldr**

**fdfind**

**ripgrep**

**zoxide**

**batcat**

**duf**

**fzf**

**lsd**

**htop**

### gitconfig

### cargo

### tmux && plugins

If you want use fzf-tab in tmux, the tmux version should >=3.2

**tmux plugins manager**

* prefix + I

note: uppercase I.
Installs new plugins from GitHub or any other git repository
Refreshes TMUX environment.

* prefix + U

updates plugin(s)

* prefix + alt + u

remove/uninstall plugins not on the plugin list

**tmux-prefix-highlight**
**tmux-resurrect**
**tmux-continuum**
**tmux-copycat**
**tmux-yank**
**tmux-open**
