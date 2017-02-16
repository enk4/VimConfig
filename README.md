# Enk4's VimConfig
##  A vim configuration as learning material for dummy and beginner.
This Vim Configuration created to utilise mainly for lite coding and writing. It is optimised to work on Markdown, JS, C#, XML, HTML and CSS. I make this as clean as possible and you definitely need to access the specific files to do specific things. I do give comment to almost all configuration listed here, so you can see them as 'cheat sheet', especially for people who are new to vim and want to make configuration.

I divide this VimConfig into several files:

| File | Contents |
| --- | --- |
| .vimrc | Main configuration which shown at ~/ |
| .vimrc.plugins | all plugin used in this configuration |
| .vimrc.config | main configuration, you usually see this within main .vimrc |
| .vimrc.keymaps | all keymaps to native vim command. Plugin's specific keymap not included here |
| .vimrc.plugin.config | configuration for plugins used in this vim configuration. Including keymaps |

Again, you **definitely** need to add your custom configuration in those specific file, especially the plugins since plugin and plugin configuration will not work if the order is upside down.

## Requirements
You need these dependency before you can use this config:
- Vim built with python, you can use the installer [here](https://github.com/vim/vim-win32-installer/releases/tag/v8.0.0003)
- [Git for Windows](https://git-for-windows.github.io/)
- [Python](https://www.python.org/downloads/)

## Folder structure
The folder structure of this vim configuration is here:

```sh
    ~\
    +---.vimrc
    |
    +---\VimConfig
    |   +---.vimrc.plugins
    |   +---.vimrc.config
    |   +---.vimrc.keymaps
    |   +---.vimrc.plugin.config
    |
    +---\.vim
    |   \---\bundles
    |
    +---\.vimview
    +---\.vimswap
    +---\.vimbackup
    +---\.vimundo
```

Please note that the `~\` means `%USERPROFILE%` or `C:\Users\[Your User]`

## GUI configuration
### Tab & Space
I use space instead of tab, so I map tab button to add 4 spaces. You can comment this if you are a tab user.

### Folding
I use syntax folding, if you want to use other folding style globally, please refer to `:h fold`. You can change using your preferred folding methods.

### Theme
I use the [gruvbox](https://github.com/morhetz/gruvbox) colorscheme in this configuration. You can use your own preferred colorscheme. Just put it at .vimrc.plugins and install it. This configuration use dark background as default.

### Font
The font used here is [FuraMonoPowerline_NF](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraMono), you can browse ryanoasis' repo [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) to find the font that suit you. Please use the font that support powerline in order for the vim airline powerline symbol to works correctly.

## Keymaps
### leader key
The default leader key used at vim is `\`, which is hard to reach, so I map the key into `,`. Feel free to map or comment out the mapleader as you see fit.

### $ key
$ key used to go to the end of line, since I'm using my own custom keyboard (VBLX-dvorak) derived from Programmer-Dvorak, the $ located at tilde (~) key, which is very far, therefore I swap the key with `q`. This may not make sense for QWERTY user, so feel free to comment it out.

### Navigation between split
I have eliminate the need to press `<C-W>` before `<C-[navigation key]>` to navigate between split. So when you need to jump to other split, just press `<C-[direction]>`. Ex: `<C-H>` will jump you to left split, while `<C-K>` will jump you to top split.

### Some shortcut
Here are some shortcut you might find interesting.

| shortcut | functions |
| --- | --- |
| `,bg` | switch background between dark and light |
| `,ns` | set nospell, useful when you hate those error mark at writing markdown |
| `F5` | Insert current timestamp |
| `,{1..x}` | open the buffer at number x |
| `F7` | Invoke TagbarToggle |
| `F8` | Invoke GundoToggle |
| `<C-E>` | Toggle NERDTree |
| `,sp` | implement :SoftPencil |

## Plugins
I use [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin manager.

These are the plugins I put in this configuration:

| Plugin | Function |
| --- | --- |
| [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) | Code Completion, you need to build it before it works |
| [UltiSnips](https://github.com/sirver/ultisnips) | Syntax snippet |
| [Gundo](https://github.com/sjl/Gundo.vim) | Undo history |
| [vimproc](https://github.com/shougo/vimproc.vim) | run command and got result from within vim |
| [vimshell](https://github.com/shougo/vimshell.vim) | a shell, within vim, nuff said |
| [tagbar](https://github.com/majutsushi/tagbar) | code tags |
| [vim-airline](https://github.com/bling/vim-airline) | status bar for vim |
| [numbers](https://github.com/myusuf3/numbers.vim) | better line number |
| [syntastic](https://github.com/scrooloose/syntastic) | showing your code is wrong |
| [vim-snippets](https://github.com/honza/vim-snippet) | snippets for UltiSnips |
| [vim-surround](https://github.com/tpope/vim-surround) | Working with surrounding symbol |
| [colorizer](https://github.com/lilydjwg/colorizer) | view color of your hex within text |
| [nerd-commenter](https://github.com/scrooloose/nerdcommenter) | commenting at vim made easy |
| [autoclose](https://github.com/Townk/vim-autoclose) | autoclose surrounding symbol |
| [closetag](https://github.com/vim-scripts/closetag.vim) | autoclose for HTML tag |
| [wakatime](https://github.com/wakatime/vim-wakatime) | track your active time, you need to register to [wakatime.com](https://wakatime.com/) first |
| [fugitive](https://github.com/tpope/vim-fugitive) | all about git utility |
| [NERDTree](https://github.com/scrooloose/nerdtree) | file exlporer within vim |
| [ctrlpvim](https://github.com/ctrlpvim/ctrlp.vim) | mru, file and buffer explorer |
| [gitgutter](https://github.com/airblade/vim-gitgutter) | git edit indicator at editor |
| [NERDTree git plugin](https://github.com/myusuf3/numbers.vim) | git indicator at NERDTree |
| [vim pencil](https://github.com/reedes/vim-pencil) | Writer tools, especially wrapping |
| [startify](https://github.com/mhinz/vim-startify) | a start page for vim |
| [devicons](https://github.com/ryanoasis/vim-devicons) | icons...for vim |

## Language pack
I have these language pack plugin installed:

- [Mustache](https://github.com/mustache/vim-mustache-handlebars) by mustache
- [vim-javascript](https://github.com/pangloss/vim-javascript) by Pangloss
- [html5](https://github.com/othree/html5.vim) by Othree
- [css](https://github.com/JulesWang/css.vim) by JulesWang
- [markdown](https://github.com/gabrielelana/vim-markdown) by Gabrielelana
- [C#](https://github.com/OmniSharp/omnisharp-vim) by Omnisharp. You need to build this one.

## Last word
Personally, I don't really encourage to depend on anyone's configuration, but indeed, they are a good start for a new user of vim. You can understand how .vimrc actually works. I don't do many keymap because I don't need them yet. I will add more if I find something I need. You can contact me if you having difficulty setting up your Vim. I will help as I can.
