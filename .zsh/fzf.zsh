# Setup fzf
# ---------
if [[ ! "$PATH" == */root/.zsh/plugins/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/root/.zsh/plugins/fzf/bin"
fi

if ! has_cmd fzf; then
  yse | ~/.zsh/plugins/fzf/install --bin --no-zsh --no-fish --no-bash
fi

eval "$(fzf --zsh)"
