" vims builtin fuzzy finding is pretty good, can replace any plugin
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

" add clipboard support
set clipboard=unnamed
" for Linux users, use unnamedplus
" set clipboard=unnamedplus

" adds that one line for the command-line
set cmdheight=1

" pretty obvious
set guifont=JetBrainsMono\ NFM\ Regular:h14

" disable the --{MODE}-- label under the statusline, its useless since we
" have lightline.vim
set noshowmode

" remove annoying scrollbars and the toolbar from your favorite splits
set guioptions=Ace

" remove annoying completion messages at the bottom
set shortmess+=c

" enables builtin syntax for some languages
filetype plugin on
syntax on

" to give space to the statusline
set laststatus=2

" # INSTALL plugins with plug.vim #
call plug#begin()

" the statusline you see at the bottom
Plug 'itchyny/lightline.vim'

" completion engine
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" prefered colorscheme :3
Plug 'rose-pine/vim'

" polyglot - treesitter like syntax highlighting
Plug 'sheerun/vim-polyglot'

" other colorschemes for eye-candy
Plug 'vim-scripts/peaksea' " Peaksea
Plug 'morhetz/gruvbox' " everybody's favorite - Gruvbox
Plug 'ghifarit53/tokyonight-vim' " Tokyonight
Plug 'joshdick/onedark.vim' " Onedark

" NERDTree - file tree plugin
Plug 'preservim/nerdtree'

" Git plugin for NERDTree
Plug 'Xuyuanp/nerdtree-git-plugin'

" vim-devicons - Adds icons to vim
Plug 'ryanoasis/vim-devicons'

" LSP and coding autocomplete
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Git plugins
" Fugitive - git wrapper plugin
Plug 'tpope/vim-fugitive'

" gitgutter - add symbols for git diff
Plug 'airblade/vim-gitgutter'

" Surround - surround text with characters
Plug 'tpope/vim-surround'

" NERD Commenter - quickly comment lines
Plug 'preservim/nerdcommenter'

" Auto pairs - does 40% of the code for you.
Plug 'jiangmiao/auto-pairs'

call plug#end()

" colorscheme options
set background=dark
let g:lightline = { 'colorscheme': 'one' }
colorscheme onedark

" # REMAPPING # "

let maplocalleader=" "
let mapleader=" "

" # PLUGIN CONFIGURATION # "

" NERDTree configuration

" bind to open file tree
silent nnoremap <leader>e :NERDTreeToggle<CR>

" exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

" set icons for those arrows
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" change window position and size
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=20

" remove labels such as bookmarks and 'Press ? for help' text.
let g:NERDTreeMinimalUI=1

" LSP SETTINGS

" add remaps for lsp commands
nnoremap <leader>dd :LspDefinition<cr>
nnoremap <leader>dn :LspNextDiagnostic<cr>
nnoremap <leader>dp :LspPreviousDiagnostic<cr>
nnoremap <leader>df :LspReferences<cr>
nnoremap <leader>dr :LspRename<cr>
nnoremap <leader>ds :LspStopServer<cr>
nnoremap <leader>dp :LspPeekDefinition<cr>
nnoremap <leader>da :LspCodeAction<cr>
nnoremap <leader>dh :LspHover<cr>
nnoremap <leader>df :LspDocumentFormat<cr> 
nnoremap <leader>dd :LspDefinition<cr>

" NERD COMMENTER SETTINGS
nnoremap <leader><space> <plug>NERDCommenterToggle

" # TODO: setup fugitive, gitgutter and auto pairs.

" ASYNCOMPLETE.VIM
" completion engine configuration

" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0

set completeopt=menuone,noinsert,preview

" auto disable the preview
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" blazingly fast completion menu
let g:asyncomplete_popup_delay=0


