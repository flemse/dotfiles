set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" *********************************************
" *          Vundle - Vim Plugins             *
" *********************************************
Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-endwise'
Bundle 'ervandew/supertab'
Bundle 'chriskempson/base16-vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'dsawardekar/ember.vim'
Bundle 'groenewege/vim-less'

" *********************************************
" *                 Settings                  *
" *********************************************
set encoding=utf-8
syntax enable
filetype plugin indent on         " load file type plugins + indentation

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set showmatch                     " Show matching brackets/parenthesis

set tabstop=2 shiftwidth=2        " a tab is two spaces (or set this to 4)
set expandtab                     " use spaces, not tabs (optional)
set backspace=indent,eol,start    " backspace through everything in insert mode"
set autoindent                    " match indentation of previous line
set autoread                      " refresh a file that is modified by another program

set incsearch                     " Find as you type search
set hlsearch                      " Highlight search terms
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set foldmethod=indent             "fold based on indent
set foldnestmax=3                 "deepest fold is 3 levels
set nofoldenable                  "dont fold by default

set hidden                        " Handle multiple buffers better.
set title                         " Set the terminal's title
set number                        " Show line numbers.
set ruler                         " Show cursor position.
set wildmode=list:longest         " Complete files like a shell.
set wildmenu                      " Enhanced command line completion.
set wildignore=*.o,*.obj,*~       "stuff to ignore when tab completing
set novisualbell
set noerrorbells
set history=1000                  " Store lots of :cmdline history

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=/tmp                " Keep swap files in one location
set timeoutlen=500

set laststatus=2                  " Show the status line all the time
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

set t_Co=256                      " Set terminal to 256 colors

autocmd BufWritePre * :%s/\s\+$//e " auto remove trailing whitespace

" *********************************************
" *               Key Bindings                *
" *********************************************
let mapleader = ","

" Clear last search highlighting
nnoremap <Space> :noh<cr>

nnoremap // <leader>ci

" *********************************************
" *           Plugin Customization            *
" *********************************************

"# ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*   " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:mustache_abbrevations=1

if filereadable(glob("~/.vim/.vimrc.rails"))
    source ~/.vim/.vimrc.rails
endif

au BufRead,BufNewFile *.prawn set filetype=ruby
au BufRead,BufNewFile Gemfile set filetype=ruby
