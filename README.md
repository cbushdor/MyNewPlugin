<!-- ------------------------------------------------------
* Created By : sdo
* File Name : README.md
* Creation Date :2024-04-24 00:11:22
* Last Modified : 2024-04-24 00:54:22
* Email Address : cbushdor@laposte.net
* Version : 0.0.0.17
* License : 
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
* 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.
* Purpose :
------------------------------------------------------ -->

[![License: CC BY-NC 3.0](https://img.shields.io/badge/License-CC_BY--NC_3.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc/3.0/)

# MyNewPlugin
This plugin is there to help testing [MaCoLib](https://github.com/cbushdor/MaCoLib) plugin...

# Technical requirements

- [Vim](https://en.wikipedia.org/wiki/Vim_(text_editor))[^1][^3] (text editor): Version 9.0.1050.
- System [macOS](https://en.wikipedia.org/wiki/MacOS): Version 13.2.1 (22D68).
- System [Fedora](https://getfedora.org/): Version 38beta (Should work on other linux [distros](https://en.wikipedia.org/wiki/List_of_Linux_distributions) too).
- Scripts: [Markdown](https://en.wikipedia.org/wiki/Markdown), [Vim Script](https://en.wikipedia.org/wiki/Vim_(text_editor)#Vim_script), [shell sh](https://en.wikipedia.org/wiki/Unix_shell).
- Vim plugin: [Vim-plug](https://github.com/junegunn/vim-plug).

[^1]: About [Vim](https://www.vim.org/about.php).
[^2]: How to install [Vim plugin](https://linuxhandbook.com/install-vim-plugins/).
[^3]: This code was based on [Vim documentation](https://vimdoc.sourceforge.net/).

>***Note***
>
> Should be ok as long as Vim Script is supported by the editor (since version 8.0).

# Instructions to install plugin
We admit that Vim-plugin is already installed. If not so, go and install [Vim-plug](https://github.com/junegunn/vim-plug).

We configure *~/.vimrc* below (~[^4][^5]):

[^4]: The ~ is equivalatent to $HOME which represent the home directory.
[^5]: $MYVIMRC is the path to file configuration *~/.vimrc* in vim environment.

```
call plug#begin('~/.vim/plugged')
Plug 'cbushdor/MaCoLib'
Plug 'cbushdor/MyNewPlugin'
call plug#end()
```

and plugin will be installed in *~/.vim/plugged* if everything is well configured. First, go in vim type *:PlugInstall* and look plugin is installing itself.

# How to use it

If you open a file in ~/Downloads s.a:

```
cd ~/Downloads
vi file.txt
```

you should have something on the screen!

# Watchout

- This plugin and documentation are still under construction. Use at YOUR OWN RISKS!

# License

Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0)
* 	Permission is granted to copy, distribute, and/or modify this document under the terms of the Creative Commons Attribution-NonCommercial 3.0
 	Unported License, which is available at http://creativecommons.org/licenses/by-nc/3.0/.

# Credits

[Vim](https://www.vim.org/)

# Contact

Email Address : cbushdor@laposte.net
