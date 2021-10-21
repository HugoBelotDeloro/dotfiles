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
abbr -a gs "git status"
abbr -a ga "git add"
abbr -a gap "git add -p"
abbr -a gp "git push"
abbr -a gpt "git push --follow-tags"
abbr -a gg "git graph"
abbr -a gcsm "git commit -sm"
abbr -a gst "git stash"

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

starship init fish | source
