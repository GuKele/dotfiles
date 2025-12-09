has_cmd() {
    for opt in "$@"; do
        if ! command -v "$opt" >/dev/null; then
            # echo "Command $opt not found"
            return 1 # 返回非0表示失败
        fi
    done
    return 0
}

# =============================================================
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

# ==================================================================
# 从指定变量中移除某些条目
var_remove() {
    local var_name="$1"
    shift  # 移除第一个参数

    for value_to_remove in "$@"; do
        eval "$var_name=\$(echo -n \${$var_name} | awk -v RS='[ :]' -v ORS=' ' '\$0 != \"$value_to_remove\"' | sed 's/[ :]\+$//; s/^[ :]\+//')"
    done

    export "$var_name"

    eval "echo after $var_name=\${$var_name}"
}

# 向指定变量的末尾追加多条目
var_append() {
    local var_name="$1"
    eval "echo before $var_name=\${$var_name}"
    shift  # 移除第一个参数，后面的参数是要追加的值

    var_remove "$var_name" "$@" >/dev/null  # 先移除已存在的值

    for value_to_append in "$@"; do
        local var_value=""
        eval "var_value=\${$var_name}"
        # 追加变量（修复: 防止前面有多余的空格）
        if [ -z "${var_value}" ]; then
            eval "$var_name=\"$value_to_append\""
        else
            eval "$var_name=\"\${$var_name} $value_to_append\""
        fi
    done

    export "$var_name"

    eval "echo after $var_name=\${$var_name}"
}

# 向指定变量的开头追加多条目
var_prepend() {
    emulate bash
    local var_name="$1"
    eval "echo before $var_name=\${$var_name}"
    shift  # 移除第一个参数，后面的参数是要追加的值

    var_remove "$var_name" "$@" >/dev/null  # 先移除已存在的值

    local values=("$@")
    for (( i=${#values[@]}-1; i>=0; i-- )); do
        local value_to_prepend="${values[i]}"
        local var_value=""
        eval "var_value=\${$var_name}"
        # 追加变量（修复: 防止后面有多余的空格）
        if [ -z "${var_value}" ]; then
            eval "$var_name=\"$value_to_prepend\""
        else
            eval "$var_name=\"$value_to_prepend \${$var_name}\""
        fi
    done
    export "$var_name"

    eval "echo after $var_name=\${$var_name}"
}

# ==================================================================
# 从指定的路径类型变量中移除某些路径
path_var_remove() {
    local var_name="$1"
    shift  # 移除第一个参数

    for value_to_remove in "$@"; do
        eval "$var_name=\$(echo -n \${$var_name} | awk -v RS=':' -v ORS=':' '\$0 != \"$value_to_remove\"' | sed 's/:$//; s/^://')"
    done

    export "$var_name"
}

# 向指定路径类型变量末尾追加多个路径（如果路径已存在，先删除再添加）
path_var_append() {
    local var_name="$1"  # 获取变量名称 (例如 PATH, GDB_AUTOLOAD_PATH)
    eval "echo before $var_name=\${$var_name}"
    shift  # 移除第一个参数，剩下的是路径

    # 先删除已存在的路径
    path_var_remove "$var_name" "$@" >/dev/null

    # 逐个处理剩下的路径，追加新路径
    for path_to_append in "$@"; do
        local var_value=""
        eval "var_value=\${$var_name}"
        # 追加路径（修复: 防止前面有多余的冒号）
        if [ -z "${var_value}" ]; then
            eval "$var_name=\"$path_to_append\""
        else
            eval "$var_name=\"\${$var_name}:$path_to_append\""
        fi
    done

    # 导出该变量以便使其生效
    export "$var_name"

    eval "echo after $var_name=\${$var_name}"
}

# 向指定的路径类型变量开头添加多个条目
path_var_prepend() {
    emulate bash
    local var_name="$1"  # 获取变量名称 (例如 PATH, GDB_AUTOLOAD_PATH)
    eval "echo before $var_name=\${$var_name}"
    shift  # 移除第一个参数，剩下的是路径

    # 先删除已存在的路径
    path_var_remove "$var_name" "$@" >/dev/null

    # 逐个处理剩下的路径，添加到开头
    local paths=("$@")
    for (( i=${#paths[@]}-1; i>=0; i-- )); do
        local path_to_prepend="${paths[i]}"
        local var_value=""
        eval "var_value=\${$var_name}"
        # 在开头添加路径（修复: 防止前面有多余的冒号）
        if [ -z "${var_value}" ]; then
            eval "$var_name=\"$path_to_prepend\""
        else
            eval "$var_name=\"$path_to_prepend:\${$var_name}\""
        fi
    done

    # 导出该变量以便使其生效
    export "$var_name"

    eval "echo after $var_name=\${$var_name}"
}


# ==================================================================
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


# ==================================================================

# 刷新 tmux 所有 session 的所有 pane
tmux_refresh_all_panes_env() {
    # 显示提示
    echo "Refresh all tmux panes with your shell env, aliases, and functions."
    echo "Warning: This will send Ctrl-C and clear to all panes (except the current one) to interrupt any running commands."
    echo -n "Proceed? [Y/N]: "
    read answer
    case "$answer" in
        [Yy]* )
            ;;
        * )
            echo "User Cancelled."
            return
            ;;
    esac

    for session_name in $(tmux list-sessions -F '#S'); do
        local session_name=$(tmux display-message -p '#S')
        # 遍历 session 中所有 pane
        for pane in $(tmux list-panes -t "$session_name"  -s -F '#{session_name}:#{window_index}.#{pane_index}:#{pane_id}'); do
            local pane_id="${pane##*:}"  # 获取冒号后面的 pane_id
            local pane_label="${pane%:*}"
            if [[ "$pane_id" != "$TMUX_PANE" ]]; then
                tmux send-keys -t "$pane_label" C-c

                tmux send-keys -t "$pane_label" "source ~/.dotfiles/.shell/env.sh > /dev/null" C-m \
                "source ~/.dotfiles/.shell/aliases.sh > /dev/null" C-m \
                "source ~/.dotfiles/.shell/functions.sh > /dev/null" C-m \
                "clear" C-m
            fi

            echo "Refreshed $pane_label"
        done
    done
}
