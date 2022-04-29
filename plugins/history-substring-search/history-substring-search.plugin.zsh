# Handle $0 according to the standard:
# https://zdharma-continuum.github.io/Zsh-100-Commits-Club/Zsh-Plugin-Standard.html
0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

source ${0:A:h}/history-substring-search.zsh


bindkey  '^P' history-substring-search-up
bindkey  '^N' history-substring-search-down
# Bind terminal-specific up and down keys

if [[ -n "$terminfo[kcuu1]" ]]; then
  bindkey -M emacs "$terminfo[kcuu1]" history-substring-search-up
  bindkey -M emacs "^P" history-substring-search-up
  bindkey -M vicmd "k" history-substring-search-up
  bindkey -M viins "$terminfo[kcuu1]" history-substring-search-up
fi
if [[ -n "$terminfo[kcud1]" ]]; then
  bindkey -M emacs "$terminfo[kcud1]" history-substring-search-down
  bindkey -M emacs "^N" history-substring-search-down
  bindkey -M vicmd "j" history-substring-search-down
  bindkey -M viins "$terminfo[kcud1]" history-substring-search-down
fi

