#! /usr/bin/env bash

# chafa 它可以将各种图像文件（如 PNG、JPEG 等）转换为 ASCII 字符表示的图像，以便在终端中显示。

# set -x
# set -e

path_append ${DOTFILES_DIR}/.local/bin

install() {
    if has_cmd cargo; then
        has_cmd delta  || cargo install git-delta
        has_cmd exa    || cargo install exa
        has_cmd procs  || cargo install procs
        has_cmd bat    || cargo install bat --locked 
        has_cmd tldr   || cargo install tealdeer
        has_cmd fd     || cargo install fd-find
        has_cmd rg     || cargo install rip-grep
        has_cmd zoxide || cargo install zoxide --locked
        has_cmd lsd    || cargo install lsd 
        has_cmd btm    || cargo install bottom --locked
        # # has_cmd shellcheck || apt install shellcheck;
    fi
    
    # duf
    if has_cmd go && ! has_cmd duf; then
        cd ${DOTFILES_DIR}/.local/share/duf && go build;
    fi
    
    # htop
    if ! has_cmd htop; then
        # echo "没有发现htop命令,开始准备安装";
        # cd ${DOTFILES_DIR}/.local/share/htop && ./configure --prefix=${DOTFILES_DIR}/.local/bin && make install;
        path_append ${DOTFILES_DIR}/.local/bin/bin;
        # echo "安装htop成功"
    fi
    
    # wudao-dict
    if ! has_cmd wd; then
        cd ${DOTFILES_DIR}/.local/share/wudao-dict/wudao-dict && bash setup.sh #或者sudo ./setup.sh
    fi
        
    # fast-fetch
    if ! has_cmd fastfetch; then
        cd ${DOTFILES_DIR}/.local/share/fastfetch && bash run.sh && cp ./build/fastfetch ../../bin/
    fi
}

install
