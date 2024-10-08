#!/usr/bin/env bash

set -e

FIFO="/tmp/preview_fifo"
[ -p "$FIFO" ] || mkfifo "$FIFO"
x=$(($(tput cols) / 2 + 1))
# y=$(($(tput rows) / 2 + 1))
# x=1
y=1
width=$FZF_PREVIEW_COLUMNS
height=$FZF_PREVIEW_LINES
start_ueberzugpp() {
    ueberzugpp layer --silent <"$FIFO" &
    exec 3>"${FIFO}"
}

cleanup() {
    rm -f "$FIFO"
}
trap cleanup HUP INT QUIT TERM PWR EXIT

preview_image() {
    echo '{"path": "'"$1"'", "action": "add", "identifier": "fzfpreview", "x": "'"$x"'", "y": "'"$y"'", "width": "'"$width"'", "height": "'"$height"'"}' >"$FIFO"
    # echo '{"path": "'"$1"'", "action": "add", "identifier": "img-fifo", "x": "'"$x"'", "y": "'"$y"'", "width": "'"$width"'", "height": "'"$height"'"}' >"$FIFO"
}

start_ueberzugpp
preview_image "$1"
wait
