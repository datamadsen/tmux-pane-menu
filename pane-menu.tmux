#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

trigger=$(tmux show-options -gv "@pane_menu_trigger")

if [ -z "$trigger" ]; then
  trigger="p"
fi

if [[ $trigger == *"-"* ]]; then
  tmux bind -n $trigger run-shell $CURRENT_DIR/source/menu.sh
else
  tmux bind $trigger run-shell $CURRENT_DIR/source/menu.sh
fi
