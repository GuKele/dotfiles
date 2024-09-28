export DOTFILES_DIR="${HOME}/.dotfiles"

# shell functions
source ${DOTFILES_DIR}/.shell/functions.sh

# cargo
source ${DOTFILES_DIR}/.cargo/cargo_init.sh
source ${DOTFILES_DIR}/.cargo/install.sh

# local tools
source ${DOTFILES_DIR}/.local/install.sh

# zsh plugins
source ${DOTFILES_DIR}/.zsh/plugins.zsh

# zsh settings
source ${DOTFILES_DIR}/.zsh/settings.zsh

# shell aliases
source ${DOTFILES_DIR}/.shell/aliases.sh

# tools alias
source ${DOTFILES_DIR}/.local/aliases.sh

# shell env
source ${DOTFILES_DIR}/.shell/env.sh

has_cmd ff && ff --pipe false