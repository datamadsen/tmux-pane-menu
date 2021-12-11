#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

menu_items=(
"'#{?#{>:#{window_panes},1},,-}Main-vertical' '<' 'select-layout main-vertical'"
"'#{?#{>:#{window_panes},1},,-}Main-horizontal' '>' 'select-layout main-horizontal'"
"'#{?#{>:#{window_panes},1},,-}Even-vertical' ',' 'select-layout even-vertical'"
"'#{?#{>:#{window_panes},1},,-}Even-horizontal' '.' 'select-layout even-horizontal'"
"'#{?#{>:#{window_panes},1},,-}Tile' 't' 'select-layout tiled'"
"'#{?#{>:#{window_panes},1},,-}Previous' 'p' 'select-layout -o'"
)

printf '%s\n' "${menu_items[@]}" \
    | xargs tmux display-menu \
     -T "#[align=centre] layouts :-) "

