# dotfiles
My ~/.dotfiles directory. All hail dotfiles.

# Installation
Dotfiles specific to my [BASH] shell environment. You might find something
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

# Oh my (BASH) shell
Until I'm finally cajoled into using [zsh] by a work colleague, my current shell
is [BASH]. The [BASH README](bash/README.md) contains specific information about
how I am using it. More importantly it contains which shortcuts I'm actively
using, and ones which I find useful, but haven't yet developed muscle memory
for.

# Productivity
It's nice to work faster in your shell, who wouldn't want that? The standout
command for productivity in this repository is combining the power of [fzf] with
[BASH]'s readline for fuzzy finding anything in `STDOUT`.

If you have [fzf] installed, `CTRL+f` has been rebound to append `| fzf` to the
end of the current command *AND* immediately send `<return>`. See
[bash/bindings.sh](bash/bindings.sh) for implemtation details.

# Conditional tools

These tools will enable additional bindings if they exist.

## GoTTY - Share your terminal as a web application

If [gotty] is in the `PATH` it will add the [tmux] binding `CTRL-t`. This will
share your tmux session with the default [gotty] parameters.

# References
* [BASH keyboard shortcuts](https://ss64.com/bash/syntax-keyboard.html)
* [Command-line fuzzy finder - fzf](https://github.com/junegunn/fzf)
* [Must have git aliases](http://durdn.com/blog/2012/11/22/must-have-git-aliases-advanced-examples/)

[BASH]: https://www.gnu.org/software/bash/
[fzf]: https://github.com/junegunn/fzfo
[gotty]: https://github.com/yudai/gotty
[tmux]: https://github.com/tmux/tmux
[zsh]: http://www.zsh.org/
