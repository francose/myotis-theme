# Gruvbox right-side prompt addon (git branch + status + exit code)
# Managed in ~/dotfiles. Sourced from ~/.zshrc.
# Colors use the terminal's ANSI palette, which is remapped to Gruvbox,
# so named slots (green/yellow/red/blue) render in Gruvbox tones.

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
# %b = branch, %u = unstaged marker, %c = staged marker
zstyle ':vcs_info:git:*' unstagedstr '%F{red}●%f'   # dirty working tree
zstyle ':vcs_info:git:*' stagedstr   '%F{yellow}●%f' # staged changes
zstyle ':vcs_info:git:*' formats     ' %F{magenta} %b%f%u%c'
zstyle ':vcs_info:git:*' actionformats ' %F{magenta} %b%f %F{red}(%a)%f%u%c'

_gruvbox_precmd() { vcs_info }
autoload -Uz add-zsh-hook
add-zsh-hook precmd _gruvbox_precmd

# Right prompt: exit code (only on failure) + background jobs + git info
RPROMPT='%(?..%F{red}✘ %?%f )%(1j.%F{yellow}⚙ %j%f .)${vcs_info_msg_0_}'
