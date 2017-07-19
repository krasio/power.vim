set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup
set nowritebackup
set history=50 " keep 50 lines of command line history
set ruler      " show the cursor position all the time
set showcmd    " display incomplete commands
set incsearch  " do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

filetype off

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tomtom/tcomment_vim'
Plugin 'fatih/vim-go'
Plugin 'kchmck/vim-coffee-script'
Plugin 'elixir-lang/vim-elixir'
Plugin 'vim-airline/vim-airline'
Plugin 'elmcast/elm-vim'
Plugin 'avh4/elm-format'

filetype plugin indent on

" Put your stuff after this line

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
au!

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif

augroup END

syntax on
set hlsearch

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" \ is the leader character
let mapleader = "\\"
nnoremap <Leader>w :w<CR>
noremap <Leader><Left> <C-w><Left>
noremap <Leader><Right> <C-w><Right>
noremap <Leader><Up> <C-w><Up>
noremap <Leader><Down> <C-w><Down>

" Color scheme
set t_Co=256
colorscheme jellybeans
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" CtrlP
map <Leader>p :CtrlP<CR>

" Fugitive
autocmd QuickFixCmdPost *grep* cwindow
map <Leader>g :Ggrep 

" Vim-Rails
map <Leader>m :Emodel 
map <Leader>c :Econtroller 
map <Leader>v :Eview 
map <Leader>s :Eservice 
map <Leader>u :Eunittest 
map <Leader>tm :Tmodel 
map <Leader>tc :Tcontroller 
map <Leader>tv :Tview 
map <Leader>ts :Tservice 
map <Leader>tu :Tunittest 
command! Eroutes :e config/routes.rb
command! ETroutes :tabe config/routes.rb
map [f <ESC>:A<CR>

" MiniTest
set completefunc=syntaxcomplete#Complete

" Hide search highlighting
map <Leader>h :set invhls <CR>
" Toggle line numbers
nnoremap <Leader>ln :set nonumber! <CR>

" Maps autocomplete to tab
imap <Tab> <C-N>
" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full
set complete=.,t

" Duplicate a selection
" Visual mode: D
vmap D y'>p

" No Help, please
nmap <F1> <Esc>

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Line numbers
set number
set numberwidth=5

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

" case only matters with mixed case expressions
set ignorecase
set smartcase

" ruby helpers
inoremap <C-k> <%=  %><Left><Left><Left><Left>
inoremap <C-j> <%  %><Left><Left><Left><Left>
inoremap <C-l> #{}<Left>

" Gemfile
au BufNewFile,BufRead Gemfile set filetype=ruby


" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :!open -a "Google Chrome.app" %:p<CR>'

set modifiable

" set laststatus=2
let g:airline_theme='ubaryd'

" elm-format
let g:elm_format_autosave = 1
