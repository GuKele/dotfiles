# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.zsh/plugins/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/root/.zsh/plugins/fzf/bin"
fi

eval "$(fzf --zsh)"
