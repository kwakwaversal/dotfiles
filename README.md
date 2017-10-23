# dotfiles
My ~/.dotfiles directory. All hail dotfiles.

# Installation
Dotfiles specific to my `BASH` shell environment. You might find something
useful in here, but I highly doubt it.

```sh
$ git clone https://github.com/kwakwaversal/dotfiles.git ~/.dotfiles
```

Run the [install script](install.sh) to set up symlinks. It will only create a
symlink if the file doesn't currently exist.

```sh
$ bash ~/.dotfiles/install.sh
Bootstrapping environment to use ~/.dotfiles

Symlink /home/vagrant/.tmux.conf:
  - ln -s ~/.dotfiles/tmux.conf /home/vagrant/.tmux.conf
    + Added

Symlink /home/vagrant/.psqlrc:
  - ln -s ~/.dotfiles/psqlrc /home/vagrant/.psqlrc
    + Added

Symlink /home/vagrant/.bash_profile:
  - ln -s ~/.dotfiles/bash_profile /home/vagrant/.bash_profile
    + Added
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
