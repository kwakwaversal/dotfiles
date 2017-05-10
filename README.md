# dotfiles
My ~/.dotfiles directory. All hail dotfiles.

# Installation
Dotfiles specific to my `BASH` shell environment. You might find something
useful in here, but I highly doubt it.

```bash
git clone https://github.com/kwakwaversal/dotfiles.git ~/.dotfiles
```

Run the script to set up symlinks. It will only create a symlink if the file
doesn't currently exist.

```sh
sh ~/.dotfiles/install.sh
```

# Productivity
It's nice to work faster in your shell, who wouldn't want that? The standout
command for productivity in this repository is combining the power of [fzf] with
bash's readline for fuzzy finding anything in `STDOUT`.

If you have [fzf] installed, `CTRL+f` has been rebound to append `| fzf` to the
end of the current command *AND* immediately send `<return>`. See
[bash/bindings.sh](bash/bindings.sh) for implemtation details.

# References
* [Bash keyboard shortcuts](https://ss64.com/bash/syntax-keyboard.html)
* [Command-line fuzzy finder - fzf](https://github.com/junegunn/fzf)
* [Must have git aliases](http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/)

[fzf]: https://github.com/junegunn/fzf
