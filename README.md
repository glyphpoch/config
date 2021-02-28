# WIP

## Alacritty + tmux

Additional keyboard shortcuts:
| Action            | Keyboard shortcut       | Notes      |
|-------------------|-------------------------|------------|
| Prefix            | **Ctrl+a**              |            |
| New window        | **Ctrl+Shift+t**        | Via Alacritty, doesn't work if multiple tmux sessions are open |
| Move window left  | **Ctrl+Shift+,**        | Via Alacritty, see above |
| Move window right | **Ctrl+Shift+.**        | Via Alacritty, see above |
| Scroll-Up         | **Ctrl+Shift+PageUp**   | Q/Esc/Return to exit copy-mode |
| Scroll-Down       | **Ctrl+Shift+PageDown** | Q/Esc/Return to exit copy-mode |

## tmux cheatsheet

| Action             | Command                                 |
|--------------------|-----------------------------------------|
| Create new session | `tmux new -s <session-name>`            |
| List sessions      | `tmux list-sessions`/`tmux ls`          |
| Attach to session  | `tmux attach-session -t <target-session>`/`tmux a -t <target-session>` |
| Kill session       | `tmux kill-session -t <target-session>` |


# Other

Back and forth reverse-i-search: `echo "stty -ixon" >> ~/.bashrc`
