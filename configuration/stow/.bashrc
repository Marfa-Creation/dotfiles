#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

fastfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
eval "$(zoxide init bash)"

. "$HOME/.cargo/env"
export LC_ALL="en_US.UTF-8"
function runasm() {
  input="$1"
  prefix=".asm"
  basename=${input%"$prefix"}

  # exit if empty
  if [[ -z "$@" ]]; then
		echo "no argument specified"
		return 1
  fi

  for arg in "$@"
  do

		if [[ $arg == "--no-run" ]]; then
			return
		fi
  
  done  

  nasm -g -f elf64 -o "$basename.o" "$1"

  if [[ $? == 1 ]]; then
  	return
  fi

  ld "$basename.o" -o $basename
  sudo "./$basename" 
}

# env var
export EDITOR=helix
export ELECTRON_OZONE_PLATFORM_HINT=auto
export PATH="$PATH:~/.npm-global/bin"
export ANKI_WAYLAND=1
export MOZ_ENABLE_WAYLAND=1

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

function helix() {
	kitten @ set-background-opacity 1
	
	/usr/bin/helix "$@"

	kitten @ set-background-opacity 0.7
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
FNM_PATH="/home/marfa/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
