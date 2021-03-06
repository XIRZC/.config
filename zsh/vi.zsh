bindkey '^v' edit-command-line
bindkey -v
# bindkey -M vicmd "i" vi-insert
# bindkey -M vicmd "a" vi-insert-bol
# bindkey -M vicmd "h" vi-backward-char
# bindkey -M vicmd "l" vi-forward-char
# bindkey -M vicmd "I" vi-beginning-of-line
# bindkey -M vicmd "A" vi-end-of-line
bindkey -M vicmd "J" down-line-or-history
bindkey -M vicmd "K" up-line-or-history
# bindkey -M vicmd "u" undo
bindkey -M vicmd "N" vi-rev-repeat-search
bindkey -M vicmd "n" vi-repeat-search
# bindkey -M vicmd "N" vi-forward-word-end

function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
	elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Use beam shape cursor on startup.
echo -ne '\e[5 q'

# Use beam shape cursor for each new prompt.
preexec() {
	echo -ne '\e[5 q'
}

_fix_cursor() {
	echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

KEYTIMEOUT=1

