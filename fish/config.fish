set -g fish_greeting ''

# PATH

set BROWSER firefox

alias gdb 'gdb -q'
alias vgr "valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --leak-resolution=high"
alias gccc "gcc -Wextra -Wall -Werror -std=c99 -pedantic -g -ggdb3"
alias clang-format-10 "clang-format"

starship init fish | source
