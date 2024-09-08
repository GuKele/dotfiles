* [1. Dotfiles](#1-dotfiles)
  * [1.1. Setup](#11-setup)
  * [1.2. describe](#12-describe)
    * [1.2.1. details](#121-details)
      * [1.2.1.1. powerlevel10k](#1211-powerlevel10k)
      * [1.2.1.2. zsh-autosuggestions](#1212-zsh-autosuggestions)
      * [1.2.1.3. zsh-syntax-highlighting](#1213-zsh-syntax-highlighting)
      * [1.2.1.4. zsh-you-should-use](#1214-zsh-you-should-use)
      * [1.2.1.5. fzf-tab](#1215-fzf-tab)
    * [1.2.2. tools](#122-tools)
      * [1.2.2.1. delta](#1221-delta)
      * [1.2.2.2. exa](#1222-exa)
      * [1.2.2.3. procs](#1223-procs)
      * [1.2.2.4. tldr (too long don't read)](#1224-tldr-too-long-dont-read)
      * [1.2.2.5. fd-find](#1225-fd-find)
      * [1.2.2.6. rip-grep](#1226-rip-grep)
      * [1.2.2.7. zoxide](#1227-zoxide)
      * [1.2.2.8. batcat](#1228-batcat)
      * [1.2.2.9. duf](#1229-duf)
      * [1.2.2.10. fzf](#12210-fzf)
      * [1.2.2.11. lsd](#12211-lsd)
      * [1.2.2.12. htop](#12212-htop)
      * [1.2.2.13. bottom](#12213-bottom)
      * [1.2.2.14. wudao-dict](#12214-wudao-dict)
      * [1.2.2.15. fast-fetch](#12215-fast-fetch)
    * [1.2.3. gitconfig](#123-gitconfig)
    * [1.2.4. cargo](#124-cargo)
    * [1.2.5. tmux \&\& plugins](#125-tmux--plugins)
      * [1.2.5.1. tpm (tmux plugins manager)](#1251-tpm-tmux-plugins-manager)
      * [1.2.5.2. tmux-prefix-highlight](#1252-tmux-prefix-highlight)
      * [1.2.5.3. tmux-resurrect](#1253-tmux-resurrect)
      * [1.2.5.4. tmux-continuum](#1254-tmux-continuum)
      * [1.2.5.5. tmux-copycat](#1255-tmux-copycat)
      * [1.2.5.6. tmux-copyrat](#1256-tmux-copyrat)
      * [1.2.5.7. tmux-yank](#1257-tmux-yank)
      * [1.2.5.8. tmux-open](#1258-tmux-open)

# 1. Dotfiles

  my dotfiles for Linux about powerful shell.

## 1.1. Setup

**you should install zsh、tmux、git by your self.**

```bash
git clone <repository_url> /your/path # clone this repository
source /your/path/setup.sh # setup

tmux
prefix + I # install tmux plugins
```

## 1.2. describe

  setup.sh will backup your dotfiles in the same directory.

### 1.2.1. details

#### 1.2.1.1. [powerlevel10k](https://github.com/romkatv/powerlevel10k?tab=readme-ov-file)

  A zsh theme. Don't forget to install recommended fonts.


#### 1.2.1.2. [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

  Fish-like fast/unobtrusive autosuggestions for zsh.

#### 1.2.1.3. zsh-syntax-highlighting

#### 1.2.1.4. [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)

  Simple zsh plugin that reminds you that you should use one of your existing aliases for a command you just typed.

  Also supports detection of global and git aliases.

#### 1.2.1.5. [fzf-tab](https://github.com/Aloxaf/fzf-tab)

  Replace zsh's default completion selection menu with fzf!

### 1.2.2. tools

delta、exa、procs、tldr、fd-find、ripgrep、zoxide、batcat、duf、fzf、lsd、htop、bottom...

#### 1.2.2.1. [delta](https://github.com/dandavison/delta)

#### 1.2.2.2. [exa](https://github.com/dandavison/delta)

  exa is a modern replacement for ls.

#### 1.2.2.3. [procs](https://github.com/dalance/procs)

  procs is a replacement for ps written in Rust.

#### 1.2.2.4. [tldr](https://github.com/dbrgn/tealdeer) (too long don't read)

  A very fast implementation of tldr(too long don't read) in Rust: Simplified, example based and community-driven man pages.
  
  The [user documentation](https://dbrgn.github.io/tealdeer/intro.html)

  Don't forget to update the local cache.

#### 1.2.2.5. [fd-find](https://github.com/sharkdp/fd?tab=readme-ov-file)

  fd is a program to find entries in your filesystem. It is a simple, fast and user-friendly alternative to find. While it does not aim to support all of find's powerful functionality, it provides sensible (opinionated) defaults for a majority of use cases.

#### 1.2.2.6. [rip-grep](https://github.com/BurntSushi/ripgrep)

  ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern. By default, ripgrep will respect gitignore rules and automatically skip hidden files/directories and binary files. (To disable all automatic filtering by default, use rg -uuu.) 

#### 1.2.2.7. [zoxide](https://github.com/ajeetdsouza/zoxide)

  It remembers which directories you use most frequently, so you can "jump" to them in just a few keystrokes.

#### 1.2.2.8. [batcat](https://github.com/sharkdp/bat)

  A cat(1) clone with syntax highlighting and Git integration.

#### 1.2.2.9. [duf](https://github.com/muesli/duf)

  Disk Usage/Free Utility (Linux, BSD, macOS & Windows)

#### 1.2.2.10. [fzf](https://github.com/junegunn/fzf)

  fzf is a general-purpose command-line fuzzy finder.

#### 1.2.2.11. [lsd](https://github.com/junegunn/fzf)

  This project is a rewrite of GNU ls with lots of added features like colors, icons, tree-view, more formatting options etc. The project is heavily inspired by the super colorls project.

#### 1.2.2.12. [htop](https://github.com/htop-dev/htop)

  htop is a cross-platform interactive process viewer.

#### 1.2.2.13. [bottom](https://github.com/ClementTsang/bottom)

  A customizable cross-platform graphical process/system monitor for the terminal.

#### 1.2.2.14. [wudao-dict](https://github.com/ChestnutHeng/Wudao-dict)

  有道词典命令行版.

  需要安装环境: 需要python3和bs4, lxml(在线搜索用).

#### 1.2.2.15. [fast-fetch](https://github.com/fastfetch-cli/fastfetch)

  Fastfetch is a neofetch-like tool for fetching system information and displaying it prettily. It is written mainly in C, with performance and customizability in mind. Currently, Linux, Android, FreeBSD, macOS, SunOS and Windows 7+ are supported.

### 1.2.3. gitconfig

### 1.2.4. cargo

### 1.2.5. tmux && plugins

If you want use fzf-tab in tmux, the tmux version should >=3.2

#### 1.2.5.1. [tpm](https://github.com/tmux-plugins/tpm) (tmux plugins manager)

* prefix + I

note: uppercase I.
Installs new plugins from GitHub or any other git repository
Refreshes TMUX environment.

* prefix + U

updates plugin(s)

* prefix + alt + u

remove/uninstall plugins not on the plugin list

#### 1.2.5.2. [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)

#### 1.2.5.3. [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)

  Restore tmux environment after system restart.

  Tmux is great, except when you have to restart the computer. You lose all the running programs, working directories, pane layouts etc. 

  mux-resurrect saves all the little details from your tmux environment so it can be completely restored after a system restart (or when you feel like it). No configuration is required. You should feel like you never quit tmux.

#### 1.2.5.4. [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum)

  Features:

* continuous saving of tmux environment

* automatic tmux start when computer/server is turned on

* automatic restore when tmux is started

#### 1.2.5.5. [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)

  tmux 3.1 adds support for native regex searches. This is great news because it means a big part of 'tmux-copycat' is now available natively! Use this plugin only if you need its other features.

#### 1.2.5.6. [tmux-copyrat](https://github.com/graelo/tmux-copyrat)

  A tmux-plugin for copy-pasting spans of text from the tmux pane's history into a clipboard.

#### 1.2.5.7. [tmux-yank](https://github.com/tmux-plugins/tmux-yank)

  Copy to the system clipboard in tmux.

#### 1.2.5.8. [tmux-open](https://github.com/tmux-plugins/tmux-open)

  Plugin for opening highlighted selection directly from Tmux copy mode.
