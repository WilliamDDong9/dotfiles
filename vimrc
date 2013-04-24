" Don't load this file when using evim
if v:progname =~? "evim"
    finish
endif
" Disable pesky ex mode
nnoremap Q <ESC>
" Prevent F1 from toggling Vim's help menu
nnoremap <F1> <ESC>
inoremap <F1> <ESC>
vnoremap <F1> <ESC>

set nocompatible          " Use vim settings natively rather than vi

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

syntax on                 " Turn syntax highlighting on
filetype plugin indent on " Enable filetype detection/language-specific indentation

set tabstop=2             " Set tab width to four spaces
set softtabstop=2         " Make tabs easier to delete
set shiftwidth=2          " Auto-indent this many spaces
set expandtab             " Turn <Tab> into spaces indicated in tabstop
set list listchars=tab:→\ ,trail:·

" Highlight trailing whitespace after leaving insert mode
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=DarkRed guibg=DarkRed
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Searching
set ignorecase            " Ignore case when searching...
set smartcase             " ...Except when search contains an uppercase char
set hlsearch              " Highlight search items

" Colors
colorscheme default       " Give vim a facelift
