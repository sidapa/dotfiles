" Make Vim more useful
set nocompatible
" required by Vundle
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-bundler'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tpope/vim-surround'
Plugin 'elixir-lang/vim-elixir'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

if has ("autocmd")
  filetype indent on
endif

" Show “invisible” characters
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set lcs=tab:▸\ ,trail:·
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
" set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
" if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
" endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" vim-airline settings
 let g:airline_left_sep=''
 let g:airline_right_sep=''
 let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
 let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
 let g:airline#extensions#branch#enabled = 1
 let g:airline#extensions#branch#empty_message = ''
" Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
" Hide function display (don't use it)
 let g:airline#extensions#tagbar#enabled = 0

" Show just the filename
 let g:airline#extensions#tabline#fnamemod = ':t'

 let g:airline_theme='molokai'

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Load a ruby scratch file (,sc)
noremap <leader>sc :vsp scratch.rb<CR>

" Save a file (,s)
noremap <leader>s :w<CR>

" Load file explorer (,e)
noremap <leader>e :vsp .<CR>

" Run Rubocop
noremap <leader>r :RuboCop<CR>

" Fugitive Maps
" Run Gstatus
noremap <leader>gs :Gstatus<CR>
" Run Gblame
noremap <leader>gb :Gblame<CR>

" ToggleBG
noremap <leader>bg :ToggleBG<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


" rcodetools vim mappings
autocmd FileType ruby nmap <buffer> <F12> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <F12> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <F12> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <F11> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <F11> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <F11> <Plug>(xmpfilter-run)

function RspecCurrent()
  :new | 0read ! be rspec #
  :setlocal buftype=nofile
  :setlocal bufhidden=hide
  :setlocal noswapfile
endfunction
noremap <leader>c :call RspecCurrent()<CR>


execute pathogen#infect()
set background=light
call togglebg#map("")
colors solarized
