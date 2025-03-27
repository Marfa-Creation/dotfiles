#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"

# do not run on TTY
# if [[ -z "$DISPLAY" && -z "$WAYLAND_DISPLAY" ]]; then
# 	echo "exe"
	eval "$(zellij setup --generate-auto-start bash)"
# fi

. "$HOME/.cargo/env"
export LC_ALL="en_US.UTF-8"
function runasm() {
  input="$1"
  prefix=".asm"
  basename=${input%"$prefix"}

  nasm -f elf64 -o "$basename.o" "$1"
  ld "$basename.o" -o $basename
  sudo "./$basename" 
}

# env var
export EDITOR=helix
export PATH="$PATH:~/.npm-global/bin"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
