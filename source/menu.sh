#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

menu_items=(
"'#{?#{window_zoomed_flag},Un-Zoom,Zoom}' z 'resize-pane -Z'"
'"Clock" c "clock-mode"'
'"Kill" x "kill-pane"'
'"-~~~~~~~~~~~~~~~~~~~~~~~ Split" "" ""'
'"Horizontal" \\ "split-window -h -c #{pane_current_path}"'
'"Vertical" - "split-window -v -c #{pane_current_path}"'
'"Above in full width" + "split-window -bf -c #{pane_current_path}"'
'"Below in full width" _ "split-window -fv -c #{pane_current_path}"'
'"Left in full height" < "split-window -fhb -c #{pane_current_path}"'
'"Right in full height" > "split-window -fh -c #{pane_current_path}"'
'"-~~~~~~~~~~~~~~~~~~~~ Navigate" "" ""'
"'#{?#{>:#{window_panes},1},,-}Visual...' v 'run-shell \"tmux display-panes -d0\"'"
"'#{?#{>:#{window_panes},1},,-}Last active' l 'last-pane'"
"'#{?#{>:#{window_panes},1},,-}Up' 'up' 'run-shell \"tmux select-pane -U && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Left' 'left' 'run-shell \"tmux select-pane -L && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Down' 'down' 'run-shell \"tmux select-pane -D && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Right' 'right' 'run-shell \"tmux select-pane -R && $CURRENT_DIR/menu.sh\"'"

'"-~~~~~~~~~~~~~~~~~~~~~~ Resize" "" ""'
"'#{?#{>:#{window_panes},1},,-}Up'    w 'run-shell \"tmux resize-pane -U 5 && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Left'  a 'run-shell \"tmux resize-pane -L 5 && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Down'  s 'run-shell \"tmux resize-pane -D 5 && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Right' d 'run-shell \"tmux resize-pane -R 5 && $CURRENT_DIR/menu.sh\"'"

'"-~~~~~~~~~~~~~~~~~~~ Rearrange" "" ""'
"'#{?#{>:#{window_panes},1},,-}Rotate up' [ 'run-shell \"tmux swap-pane -U && $CURRENT_DIR/menu.sh\"'"
"'#{?#{>:#{window_panes},1},,-}Rotate down' ] 'run-shell \"tmux swap-pane -D && $CURRENT_DIR/menu.sh\"'"
'"#{?#{>:#{window_panes},1},,-}Break to window" n "break-pane"'
"'#{?#{>:#{window_panes},1},,-}Swap visual...' 0 'display-panes -d0 \"swap-pane -t '%%' -d\"'"
"'#{?#{>:#{window_panes},1},,-}Layout prefixes...' '=' 'run-shell \"$CURRENT_DIR/layout-submenu.sh\"'"
"'#{?#{>:#{session_windows},1},,-}Send to window...' '|' 'run-shell \"$CURRENT_DIR/send-to-window-submenu.sh\"'"
)

printf '%s\n' "${menu_items[@]}" \
    | xargs tmux display-menu \
     -T "#[align=centre] pane menu :-) " \
