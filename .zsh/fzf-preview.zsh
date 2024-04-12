# you can see how to make full use of fzf's --preview option when using fzf-tab in https://github.com/Aloxaf/fzf-tab/wiki/Preview
# export RUNEWIDTH_EASTASIAN=0

mkdir -p "${DOTFILES_DIR}/.zsh/cache" && touch "${DOTFILES_DIR}/.zsh/cache/fzf_history"
export FZF_DEFAULT_OPTS="--preview 'bash ${DOTFILES_DIR}/.zsh/file_preview.sh {}' --height 12 --layout=reverse --history=${DOTFILES_DIR}/.zsh/cache/fzf_history"
export FZF_DEFAULT_COMMAND="fdfind --color=always --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build,dist,vendor} --type f"

# 配置fzf-tab插件
zstyle ':completion:complete:*:options' sort false
zstyle ':fzf-tab:*' fzf-command fzf # fzf-tab进行命令补全时，默认的搜索命令会是fzf。
zstyle ':completion:*:descriptions' format "[%d]" # fzf-tab will group the results by group description.

zstyle ':fzf-tab:*' show-group full
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:*' group-colors $'\033[15m' $'\033[14m' $'\033[33m' $'\033[35m' $'\033[15m' $'\033[14m' $'\033[33m' $'\033[35m'
zstyle ':fzf-tab:*' prefix ''
zstyle ':fzf-tab:*' switch-group 'left' 'right' # 交换组的按键

FZF_TAB_GROUP_COLORS=(
    $'\033[94m' $'\033[32m' $'\033[33m' $'\033[35m' $'\033[31m' $'\033[38;5;27m' $'\033[36m' \
    $'\033[38;5;100m' $'\033[38;5;98m' $'\033[91m' $'\033[38;5;80m' $'\033[92m' \
    $'\033[38;5;214m' $'\033[38;5;165m' $'\033[38;5;124m' $'\033[38;5;120m'
)
zstyle ':fzf-tab:*' group-colors $FZF_TAB_GROUP_COLORS


# 预览文件内容
# NOTE(gukele): 当你对命令重命名时，例如alias ls=exa, 你必须要对exa进行配置才生效。

# show file contents
zstyle ':fzf-tab:complete:*:*' fzf-preview 'bash ${DOTFILES_DIR}/.zsh/file_preview.sh ${(Q)realpath}'
# zstyle ':fzf-tab:complete:*:*' fzf-preview 'less ${(Q)realpath}'
# export LESSOPEN='|${DOTFILES_DIR}/.lessfilter %s'

# cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -a --no-user --no-time --icons --no-permissions --no-filesize "$1" 2>/dev/null $realpath' # remember to use single quote here!!!
# zstyle ':fzf-tab:complete:cd:*' query-string input

# 设置 ls 命令的补全规则，不显示文件夹
zstyle ':fzf-tab:complete:exa:*' fzf-command 'fzf'

# batcat
# zstyle ':fzf-tab:complete:batcat:*' fzf-command 'find $realpath' # remember to use single quote here!!!


# give a preview of commandline arguments when completing `kill`
# zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-preview '[[ $group == "[process ID]" ]] && ps --pid=$word -o cmd --no-headers -w -w'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap

# systemd unit status
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'SYSTEMD_COLORS=1 systemctl status $word'

# environment variable
zstyle ':fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*' \
	fzf-preview 'echo ${(P)word}'

# git
zstyle ':fzf-tab:complete:git-(add|diff|restore):*' fzf-preview \
	'git diff $word | delta'
zstyle ':fzf-tab:complete:git-log:*' fzf-preview \
	'git log --color=always $word'
zstyle ':fzf-tab:complete:git-help:*' fzf-preview \
	'git help $word | bat -plman --color=always'
zstyle ':fzf-tab:complete:git-show:*' fzf-preview \
	'case "$group" in
	"commit tag") git show --color=always $word ;;
	*) git show --color=always $word | delta ;;
	esac'
zstyle ':fzf-tab:complete:git-checkout:*' fzf-preview \
	'case "$group" in
	"modified file") git diff $word | delta ;;
	"recent commit object name") git show --color=always $word | delta ;;
	*) git log --color=always $word ;;
	esac'


# tldr
# FIXME(gukele): 补全为当前目录下文件，只能tldr ;来补全命令
zstyle ':fzf-tab:complete:tldr:argument-1' fzf-preview 'tldr --color always $word'

# Commands
zstyle ':fzf-tab:complete:-command-:*' fzf-preview \
 '(out=$(tldr "$word") 2>/dev/null && echo $out | batcat --color=always) || (out=$(MANWIDTH=$FZF_PREVIEW_COLUMNS man "$word") 2>/dev/null && echo $out | batcat --color=always) || (out=$(which "$word") && echo $out | batcat --color=always) || echo "${(P)word | batcat --color=always}"'
