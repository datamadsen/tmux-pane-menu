#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

menu_items=(
'"" "" ""'
)

IFS='!'

join_to_window_items=$(tmux list-windows -F '"#{?#{==:#{window_active},1},-,}#{window_index} #{window_name} #{?#{==:#{window_active},1},(this window),}" #{window_index} "join-pane -t :#{window_index}"!' )

for item in $join_to_window_items
do
    menu_items+=(${item})
done

printf '%s\n' "${menu_items[@]}" \
    | xargs tmux display-menu \
     -T "#[align=centre] send to window :-) "
