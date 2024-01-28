# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $HOME/.config/zsh/.p10k.zsh ]] || source $HOME/.config/zsh/.p10k.zsh

HIST_STAMPS="yyyy-mm-dd"
export HISTFILE=$HOME/.config/zsh/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

## Timestamp format
#case ${HIST_STAMPS-} in
#  "mm/dd/yyyy") alias history='zsh_history -f' ;;
#  "dd.mm.yyyy") alias history='zsh_history -E' ;;
#  "yyyy-mm-dd") alias history='zsh_history -i' ;;
#  "") alias history='zsh_history' ;;
#  *) alias history="zsh_history -t '$HIST_STAMPS'" ;;
#esac

## History file configuration
#[ -z "$HISTFILE" ] && HISTFILE="$HOME/.config/zsh/.zsh_history"
#[ "$HISTSIZE" -lt 1000000000 ] && HISTSIZE=1000000000
#[ "$SAVEHIST" -lt 1000000000 ] && SAVEHIST=1000000000

## History command configuration
setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt SHARE_HISTORY          # share command history data
setopt INC_APPEND_HISTORY     # add new history incrementally

## To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
#[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#xmodmap $HOME/.config/zsh/.Xmodmap

source $HOME/.config/zsh/.zsh_aliases
source $HOME/.config/zsh/.zsh_plugins
source $HOME/.config/zsh/.zsh_bindkeys
source $HOME/.config/zsh/.zsh_functions
