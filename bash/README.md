# BASH README
An overview of my [BASH]'ing.

# Description
This README is a gentle reminder about shortcuts and productivity tools I use in
my day-to-day hacking.

# Shortcuts
The standard mode in [BASH] comes with a surprising amount of useful shortcuts
that I never really used. Below are ones I use quite often, some I'm forcing
myself to use, and others I might want to use in the future.

| Shortcut      | Description                                       | Using     | Training  |
|-------------  |-------------------------------------------------- |-------    |---------- |
| Ctrl+a        | Go to the beginning of the line                   | ✓         |           |
| Ctrl+e        | Go to the end of the line                         | ✓         |           |
| Ctrl+x *      | Expand * wildcard                                 |           | ✓         |
| Ctrl+Alt+#    | Comment current command line                      |           | ✓         |
| Ctrl+xx       | Toggle between start and current cursor position  |           | ✓         |
| Alt+f/right   | Forward one word                                  | ✓         |           |
| Alt+b/left    | Back one word                                     | ✓         |           |
| Alt+t         | Swap current word with previous                   |           | ✓         |
| Alt+.         | Use last word of previous command                 |           | ✓         |
| Ctrl+n        | Next command                                      | ✓         |           |
| Ctrl+p        | Previous command                                  | ✓         |           |
| Ctrl+Alt+e    | Expand BASH variables in current line             |           | ✓         |
| Ctrl+r        | Reverse history search                            | ✓         |           |
| Alt+d         | Delete word to the right of the cursor            |           | ✓         |
| Ctrl+w        | Delete word to the left of the cursor             | ✓         |           |
| Ctrl+y        | Paste delete buffer after cursor                  | ✓         |           |

# Tools
Tools I use in my day-to-day hacking in an attempt to be a more productive human
being.

## fzf
I am using [fzf] for fuzzy finding on the command line (as well as in [vim]). I
mainly use it for quickly searching through lots of data. I use it so often for
this that I have rebound [BASH]'s `Ctrl+f` (forward one character) to append
`| fzf` to the end of the current command line and send a `<return>`.

| Shortcut  | Description                                                    | Using | Training |
|-----------|----------------------------------------------------------------|-------|----------|
| Ctrl+f    | Append &#124;` fzf` and `<return>` (see bindings.sh)           | ✓     |          |
| Ctrl+r    | Rebound by fzf install script to fuzzy search BASH history     | ✓     |          |
| **`<tab>` | Fuzzy completion for files and directories                     |       | ✓        |
| Alt+c     | cd into the selected directory                                 |       | ✓        |
| Ctrl+t    | Paste the selected files and directories onto the command line |       | ✓        |

# References
* https://www.skorks.com/2009/09/bash-shortcuts-for-maximum-productivity

[BASH]: https://www.gnu.org/software/bash/
[fzf]: https://github.com/junegunn/fzf
[fzf.vim]: https://github.com/junegunn/fzf.vim
[vim]: http://www.vim.org/
