#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
eval "$(starship init bash)"
eval "$(zellij setup --generate-auto-start bash)"
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
