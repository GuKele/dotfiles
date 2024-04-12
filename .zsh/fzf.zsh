# Setup fzf
# ---------
if [[ ! "$PATH" == *${DOTFILES_DIR}/.zsh/plugins/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${DOTFILES_DIR}/.zsh/plugins/fzf/bin"
fi

if ! has_cmd fzf; then
  yse | ${DOTFILES_DIR}/.zsh/plugins/fzf/install --bin --no-zsh --no-fish --no-bash
fi

eval "$(fzf --zsh)"
