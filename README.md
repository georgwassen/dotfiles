dotfiles
========

My Linux config files.

personal information
--------------------
To avoid including personal information in this repository, a Makefile
is provided, that processes `*.in` files to include informatioin from 
a `personal.conf` file that must be created/updated/maintained by every
user. The file can be copied from `personal.conf.template`. After modifying
it and after pulling from the repository, just execute `make`.
Files created from `*.in` versions should never be modified directly.
Instead change the `*.in` file and run `make` to update the config file.

vim
---
`.vimrc` uses Vundle to manage plugins. Documentation on how to set up
Vundle after installation of this dotfile is in `.vimrc`.
The plugin directory `.vim` is generated empty and will be populated by
Vundle using mainly git to clone plugin repositories.
YouCompleteMe needs the manual build of C libraries. Short howto in `.vimrc`,
but you should RTFM if you don't know YCM.

git
---
The git configuration `.gitconfig` contains a `[user]` section where one provides its
identity for git commits. These fields are populated by the Makefile from
information that must be provided in `personal.conf`.

TODO
----
 * add `.bashrc` (and/or `.bash_profile`, `.profile`, etc.)
 * add `.ssh/config`

