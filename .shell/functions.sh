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
# 从指定变量中移除某个条目
var_remove() {
    local var_name="$1"
    local value_to_remove="$2"
    
    eval "$var_name=\$(echo -n \${$var_name} | awk -v RS='[ :]' -v ORS=' ' '\$0 != \"$value_to_remove\"' | sed 's/[ :]\+$//; s/^[ :]\+//')"
    export "$var_name"
}

# 向指定变量的末尾追加多条目
var_append() {
    local var_name="$1"
    shift  # 移除第一个参数，后面的参数是要追加的值

    for value_to_append in "$@"; do
        var_remove "$var_name" "$value_to_append"  # 先移除已存在的值
        eval "$var_name=\"\${$var_name} $value_to_append\""
    done
    export "$var_name"
}

# 向指定变量的开头追加多条目
var_prepend() {
    local var_name="$1"
    shift  # 移除第一个参数，后面的参数是要追加的值

    for value_to_prepend in "$@"; do
        var_remove "$var_name" "$value_to_prepend"  # 先移除已存在的值
        eval "$var_name=\"$value_to_prepend \${$var_name}\""
    done
    export "$var_name"
}

# ==================================================================
# 从指定的路径类型变量中移除某个条目
path_var_remove() {
    local var_name="$1"
    local value_to_remove="$2"

    eval "$var_name=\$(echo -n \${$var_name} | awk -v RS=':' -v ORS=':' '\$0 != \"$value_to_remove\"' | sed 's/:$//; s/^://')"
    export "$var_name"
}

# 向指定路径类型变量末尾追加多个路径（如果路径已存在，先删除再添加）
path_var_append() {
    local var_name="$1"  # 获取变量名称 (例如 PATH, GDB_AUTOLOAD_PATH)
    shift  # 移除第一个参数，剩下的是路径

    # 如果变量不存在，初始化为空字符串
    eval "temp_var_name=\"\${$var_name}\""
    if [ -z "${temp_var_name}" ]; then
        eval "$var_name=\"\""  # 初始化该变量为空字符串
    fi

    # 逐个处理剩下的路径，先删除已存在的路径，再追加新路径
    for path_to_append in "$@"; do
        path_var_remove "$var_name" "$path_to_append"

        # 追加路径（修复: 防止前面有多余的冒号）
        if [ -z "${!var_name}" ]; then
            eval "$var_name=\"$path_to_append\""
        else
            eval "$var_name=\"\${$var_name}:$path_to_append\""
        fi
    done

    # 导出该变量以便使其生效
    export "$var_name"
}

# 向指定的路径类型变量开头添加多个条目
path_var_prepend() {
    local var_name="$1"  # 获取变量名称 (例如 PATH, GDB_AUTOLOAD_PATH)
    shift  # 移除第一个参数，剩下的是路径

    # 如果变量不存在，初始化为空字符串
    eval "temp_var_name=\"\${$var_name}\""
    if [ -z "${!temp_var_name}" ]; then
        eval "$var_name=\"\""  # 初始化该变量为空字符串
    fi

    # 逐个处理剩下的路径，先删除已存在的路径，再添加到开头
    for path_to_prepend in "$@"; do
        path_var_remove "$var_name" "$path_to_prepend"

        # 在开头添加路径（修复: 防止前面有多余的冒号）
        if [ -z "${!var_name}" ]; then
            eval "$var_name=\"$path_to_prepend\""
        else
            eval "$var_name=\"$path_to_prepend:\${$var_name}\""
        fi
    done

    # 导出该变量以便使其生效
    export "$var_name"
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


