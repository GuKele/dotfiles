#!/usr/bin/env bash

set -e

source ${DOTFILES_DIR}/.shell/functions.sh

mime=$(file -bL --mime-type "$1")
category=${mime%%/*}
kind=${mime##*/}

if [ -d "$1" ]; then
	if has_cmd exa; then
	    exa --icons --no-user --no-time --no-permissions --no-filesize "$1" 2>/dev/null
    else
	    ls --color "$1"
	fi
elif [ "$category" == image ]; then
	# chafa "$1"
	# exiftool "$1"
    (${DOTFILES_DIR}/.zsh/img_preview.sh $1) 2>/dev/null

elif [ "$kind" == vnd.openxmlformats-officedocument.spreadsheetml.sheet ] || [ "$kind" == vnd.ms-excel ]; then
	if has_cmd in2csv; then
        in2csv "$1" | xsv table | batcat -ltsv --color=always
    fi

elif [ "$category" == text ]; then
    if has_cmd batcat; then
        batcat --color=always "$1"
    elif has_cmd bat; then
        bat --color=always "$1"
    else
        cat --color "$1"
    fi
elif [ "mine" == application/pdf ]; then
    if has_cmd pdftotext; then
        pdftotext $1 - | less
    fi
else
	lesspipe.sh "$1" | batcat --color=always
fi
