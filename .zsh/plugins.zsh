autoload -U compinit; compinit

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-${HOME}/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# add fzf path and set up shell integration.
source ${DOTFILES_DIR}/.zsh/fzf.zsh

source ${DOTFILES_DIR}/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit p10k.zsh
[[ ! -f ${DOTFILES_DIR}/.zsh/p10k.zsh ]] || source ${DOTFILES_DIR}/.zsh/p10k.zsh

# fzf-tab preview and fzf part-settings
source ${DOTFILES_DIR}/.zsh/fzf-preview.zsh

# fzf-tab needs to be loaded after compinit, but before plugins which will wrap widgets, such as zsh-autosuggestions or fast-syntax-highlighting
# autoload -U compinit; compinit
source ${DOTFILES_DIR}/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# For completions to work, the above line must be added after compinit is called.
# You may have to rebuild your completions cache by running rm ${DOTFILES_DIR}/.zcompdump*; compinit.
if has_cmd zoxide; then
  eval "$(zoxide init zsh)"
fi

source ${DOTFILES_DIR}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${DOTFILES_DIR}/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ${DOTFILES_DIR}/.zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh
