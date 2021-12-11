# tmux-pane-menu :-)

A tmux menu to expose some of the functionality surrounding panes in tmux. It's
the kind of thing that will help reduce the amount of tmux prefix shortcuts you
have to remember and/or configure.

## What it can do
We have some basic stuff to begin with:

* Zoom pane to maximie the pane you're currently using.
* Show a clock in a pane (neat party trick lol, and good for being mindful
  about the time when getting lost in having fun).
* Kill a pane if/when for whatever reason it stops responding.

### Split
You have your normal way of doing splits and maybe your abnormal ones:

* Split horizontal (a pane is split down the middle)
* Split vertical (a pane is split across)
* Create new splits above or below in full width.
* Create splits to the left or right in full height.

### Navigate
Of course you can also navigate between panes with this little menu. The menu
will stay on screen while you navigate so it's easy to quickly navigate once you
have begun. You can also:

* Navigate to a pane in a visual way.
* Navigate the last active pane.

### Resize
Get all your resizing done with this menu with w, a, s, d keys and feel like a
million bucks.

### Rearrange
Rotate your panes, swap them, break them put into new windows, send them to
existing windows or use layout prefixes :-)

## What it looks like

![main](/screenshots/pane-menu.png)

## How to install it
Use [TPM](https://github.com/tmux-plugins/tpm) for a smooth experience. Add
this to your tmux.conf:

```
set -g @plugin 'datamadsen/tmux-pane-menu'
```

Then hit `prefix + I` and you're good to go. Use `prefix + U` from time to time
to update plugins managed by TPM.

## How to invoke it
By default the menu is invoked with `prefix + p` (p for pane), but you can
change it like this in your tmux.conf:

```
set -g @pane_menu_trigger 'a'
```

If you want to invoke it without tmux' prefix, e.g. with `Ctrl-P`, you can
configure that like this:

```
set -g @pane_menu_trigger 'C-p'
```
