#!/usr/bin/env bash

function init_claude() {
    local SCRIPT_DIR="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
    local DOTFILES_DIR="$(dirname "$SCRIPT_DIR")"
    local PLUGINS_FILE="$SCRIPT_DIR/plugins.json"

    source "$DOTFILES_DIR/.shell/functions.sh"

    if ! has_cmd claude; then
        echo "==> 未检测到 claude, 开始安装"
        curl -fsSL https://claude.ai/install.sh | bash

        path_append "$HOME/.local/bin"
    fi

    if ! has_cmd claude; then
        echo "claude 安装失败或不在 PATH 中, 跳过插件安装"
        return 0
    fi

    if ! has_cmd jq; then
        echo "未找到 jq, 跳过 claude 插件安装"
        return 0
    fi

    echo "==> 更新 marketplace 缓存"
    claude plugin marketplace update || echo "    更新失败, 继续尝试安装"

    local failed=()
    while read -r name marketplace; do
        [ -z "$name" ] && continue
        echo "==> 安装插件: ${name}@${marketplace}"
        claude plugin install "${name}@${marketplace}" || failed+=("${name}@${marketplace}")
    done < <(
        jq -r '.plugins[] | "\(.name) \(.marketplace)"' "$PLUGINS_FILE"
    )

    if [ ${#failed[@]} -gt 0 ]; then
        echo "以下插件安装失败: ${failed[*]}"
    fi

    echo "claude 初始化完成"
}

init_claude
