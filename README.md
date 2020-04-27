![Screenshot](/screenshot.png?raw=true)

# Dotfiles
All my dotfiles. This project replaces three old separate dotfile projects:

- tmux: https://github.com/bhalash/tmux
- vim:  https://github.com/bhalash/vim
- zsh:  https://github.com/bhalash/zsh

## Setup

```shell
git clone --recursive https://github.com/bhalash/dotfiles
```

## vim
This is my current [vimrc][1], gvimrc and filetype files. Run [Vundle's](https://github.com/VundleVim/Vundle.vim) `:PluginInstall` command:

```shell
vim +PluginInstall +qall
```

### Powerline
My vim config requires that the [patched Powerline fonts](https://github.com/powerline/fonts) be installed and your terminal configured to use them.

## License
Copyright 2015-2020 Mark Grealish. Licensed under the GPLv3 or later.

> This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public > License, version 3, as published by the Free Software Foundation.
>
> This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

A copy of the license is included in the project's root directory. The file is named [LICENSE](/LICENSE).
