set -g fish_greeting ''

# PATH
set -x PGDATA $HOME/postgres_data
set -x PGHOST /tmp

# JAVA_HOME
set -x JAVA_HOME '/home/hugo/.jdks/openjdk-16/'

set BROWSER firefox
set EDITOR kak

alias gdb 'gdb -q'
abbr -a vgr "valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --leak-resolution=high"
abbr -a gccc "gcc -Wextra -Wall -Werror -std=c99 -pedantic -g -ggdb3"
abbr -a g+++ "g++ -Wextra -Wall -Werror -std=c++17 -pedantic"
abbr -a clangpp "clang++ -Wextra -Wall -Werror -std=c++17 -pedantic"

# Git
if type -q git
  abbr -a gs "git status"
  abbr -a ga "git add"
  abbr -a gap "git add -p"
  abbr -a gp "git push"
  abbr -a gpt "git push --follow-tags"
  abbr -a gg "git graph"
  abbr -a gcsm "git commit -sm"
  abbr -a gst "git stash"
  abbr -a gsw "git switch"
  abbr -a gcm "git commit -m"
  abbr -a gca "git commit --amend"
  abbr -a gcane "git commit --amend --no-edit"
  abbr -a g "git"
end

# Exa
if type -q exa
  alias ls   "exa --classify"
  alias la   "exa --classify --all"
  alias lla  "exa --classify --all --long --header"
  alias tree "exa --classify --all --long --header --tree"
end

alias alert "echo -ne '\a'"
alias clang-format-10 "clang-format"
alias fmt 'find -path ./lib/vendor -prune -o -name flex-lexer.hh -o -name _build -prune -o -name .git -prune -o -newer format_marker \( -name '\''*.cc'\'' -o -name '\''*.hh'\'' -o -name '\''*.hxx'\'' -o -name '\''*.[ch]'\'' -o -name '\''*.cpp'\'' -o -name '\''*.cxx,'\'' -o -name '\''*.c++'\'' -o -name '\''*.hpp'\'' -o -name '\''*.h++'\'' \) -exec clang-format -i -style=file \{\} \; && touch format_marker'
alias tmate "tmate -f ~/.tmux.conf"

function tmux-help
    printf "\t%s\n" \
    "tmux: new session"\
    "tmux det(ach): save session then detaches from it"\
    "tmux at(tach) [-t <target>] [-d]: re-attaches to a session. -d to detach all other clients connected to it"\
    "tmux new -s <name>: creates a new session with a name"\
    "tmux rename [-t <target>] <new_name>: renames current session"\
    ""\
    "Key bindings:"\
    "C-w: prefix (use before other commands)"\
    "/: split"\
    "-: vsplit"\
    "hjkl: move between panes, vim-style"\
    "r: reload tmux config"\
    "C-w: go to last window"\
    "Other key bindings should be default"
end

function kitty-help
    echo "Font:"
    printf "\t%s\n" \
    "C-S-minus: decrease font size"\
    "C-S-plus: increase font size"
    echo "Tabs:"
    printf "\t%s\n" \
    "C-S-t: new tab"\
    "C-S-q: close tab"\
    "C-S-left: previous tab"\
    "C-S-right: next tab"\
    "C-S-,: move tab left"\
    "C-S-;: move tab right"
    echo "Windows:"
    printf "\t%s\n"\
    "C-S-enter: new window"\
    "C-S-\$: new window (horizontal split)"\
    "C-S-w: close window"\
    "C-S-up: previous window"\
    "C-S-down: next window"
end

function fix-colors -d "Fix the terminal's colors"
  echo -ne "\033[0m"
end

starship init fish | source

if type -q rbenv
  status --is-interactive; and rbenv init - fish | source
end

set -x N_PREFIX "$HOME/n"; contains "$N_PREFIX/bin" $PATH; or set -a PATH "$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
