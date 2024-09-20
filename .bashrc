export DOTFILES_DIR="${HOME}/.dotfiles"

# shell functions
source ${DOTFILES_DIR}/.shell/functions.sh

# cargo
source ${DOTFILES_DIR}/.cargo/cargo_init.sh
source ${DOTFILES_DIR}/.cargo/install.sh

# local tools
source ${DOTFILES_DIR}/.local/install.sh

# shell aliases
source ${DOTFILES_DIR}/.shell/aliases.sh

# tools alias
source ${DOTFILES_DIR}/.local/aliases.sh

export PRIVATE_DEBUG="$PRIVATE_DEBUG -DDEBUG_MXF -DDEBUG_GUKELE"

has_cmd ff && ff
