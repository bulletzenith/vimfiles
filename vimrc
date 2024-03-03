" SET SETTINGS

" vims builtin fuzzy file finding is pretty good, can replace any plugin
set path+=**

" adds the menu which shows completions availiable in command mode
set wildmenu

" gets rid of ye olde vi style, its 2023 boy
set nocompatible

" lets you use your mouse in gVim 9.0
set mouse=a

" fixes backspace in gVIm Windows x64. backspace in insert mode doesnt work
" like expected, instead it just rings the bell and does nothing.
set backspace=indent,eol,start

" adds the line and column number for the statusline, although its useless
" when you have a statusline plugin
set ruler

" set scrolloff to scroll while having 7 lines visible, very useful when
" scrolling with j/k
set scrolloff=7

" replaces tabs with whitespace instead of actual tabs
set expandtab

" on pressing tab, insert 2 spaces
set tabstop=2
set softtabstop=2

" 'when indenting with > use 2 spaces width' idk just found it on the
" internet
set shiftwidth=2

" sets the line number on the side, very useful
set number
set relativenumber

" search related
set hlsearch
set incsearch

" automatically nohl after done searching
autocmd CmdlineLeave /,\? if getcmdtype() =~ "[/\\?]" | nohlsearch | endif

" add clipboard support
set clipboard=xclip
