export DOTFILES_DIR="${HOME}/.dotfiles"

# shell functions
source ${DOTFILES_DIR}/.shell/functions.sh

path_append ${DOTFILES_DIR}/.cargo/bin

# local tools
source ${DOTFILES_DIR}/.local/install.sh

# shell aliases
source ${DOTFILES_DIR}/.shell/aliases.sh

# tools alias
source ${DOTFILES_DIR}/.local/aliases.sh


