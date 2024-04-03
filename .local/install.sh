#! /usr/bin/env bash

# ripgrep 用于将 PDF 文档转换为纯文本文件。
# chafa 它可以将各种图像文件（如 PNG、JPEG 等）转换为 ASCII 字符表示的图像，以便在终端中显示。

# apt not search "procs bottom neovide dust lsd"

# set -x
# set -e



install() {
    if ! has_cmd tldr; then
        apt install tldr
    fi

    if ! has_cmd exa; then
        apt install exa
    fi

    if ! has_cmd fdfind; then
        apt install fd-find
    fi

    if ! has_cmd rg; then
        apt install ripgrep
    fi

    if ! has_cmd zoxide; then
        apt install zoxide
    fi

    if ! has_cmd batcat; then
        if ! has_cmd bat; then
        apt install bat
        fi
    fi

    if ! has_cmd duf; then
        apt install duf
    fi



    if grep -q "Ubuntu" /etc/os-release; then

        if ! has_cmd lsd; then
            if grep -q "Ubuntu" /etc/os-release; then
                ln -s ~/.local/bin/lsd /usr/bin/lsd
            else
                tools+=" lsd"
            fi
        fi

        if ! has_cmd delta; then
            if grep -q "Ubuntu" /etc/os-release; then
                ln -s ~/.local/bin/delta /usr/bin/delta
            else
                tools+=" delta"
            fi
        fi

        if ! has_cmd procs; then
            if grep -q "Ubuntu" /etc/os-release; then
                ln -s ~/.local/bin/procs /usr/bin/procs
            else
                tools+=" procs"
            fi
        fi

        if ! has_cmd tldr; then
            if grep -q "Ubuntu" /etc/os-release; then
                ln -s ~/.local/bin/tldr /usr/bin/tldr
            else
                tools+=" tldr"
            fi
        fi


        if [ -n "$tools" ]; then
            echo "You should install${tools}"
        fi

    else # use cargo install
        if ! has_cmd cargo; then
            apt install cargo
        fi

        if ! has_cmd delta; then
            cargo install git-delta
        fi

        if ! has_cmd procs; then
            cargo install procs
        fi

        if ! has_cmd tldr; then
            cargo isntall tealdeer
        fi
    fi

}

install
