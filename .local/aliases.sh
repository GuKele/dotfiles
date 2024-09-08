has_cmd tldr && alias t='tldr'
# has_cmd lsd && alias ls='lsd'
has_cmd exa && alias ls='exa --icons --color=auto'

if has_cmd batcat; then
    alias cat='batcat'
elif has_cmd bat; then
    alias cat='bat'
fi

has_cmd exa && alias e='exa --icons'
has_cmd btm && alias top='btm'
has_cmd procs && alias p='procs'
has_cmd neovide && alias ne='neovide'

if has_cmd fdfind && ! has_cmd fd; then
    alias fd='fdfind'
fi

has_cmd dust && alias du='dust'
has_cmd duf && alias df='duf'
has_cmd delta && alias diff='delta'
has_cmd z && alias cd='z'
has_cmd rg && alias grep='rg'
has_cmd procs && alias p='procs'
has_cmd fastfetch && alias ff='fastfetch'