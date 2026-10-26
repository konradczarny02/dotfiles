# Drop duplicate PATH entries (nested shells in tmux / nvim re-run this file)
typeset -U path PATH

# --- oh-my-zsh ------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# --- environment ----------------------------------------------------------
export EDITOR=nvim
export VISUAL=nvim

setopt hist_ignore_all_dups hist_ignore_space

export PNPM_HOME="${PNPM_HOME:-$HOME/Library/pnpm}"
path=(
  $HOME/.opencode/bin
  $HOME/.local/bin
  $PNPM_HOME
  $path
  $HOME/go/bin
)

# --- tools ----------------------------------------------------------------
eval "$(fnm env --use-on-cd)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# --- aliases --------------------------------------------------------------
alias v=nvim
alias vim=nvim
alias zshrc="nvim ~/dotfiles/.zshrc"

# --- plugins (syntax highlighting must be sourced last) -------------------
BREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
