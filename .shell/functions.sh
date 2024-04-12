has_cmd() {
    for opt in "$@"; do
        if ! command -v "$opt" >/dev/null; then
            return 1 # 返回非0表示失败
        fi
    done
    return 0
}

path_remove() {
    PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: "\$0 != \"$1\"" | sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "${HOME}/.shell.here"
    echo "here -> $(readlink ${HOME}/.shell.here)"
}

there="${HOME}/.shell.here"

there() {
    cd "$(readlink "${there}")"
}


