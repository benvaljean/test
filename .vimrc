"BG vimrc 0.1.8


"vimrc
"0.1.5
"added Q q and qq q! cmaps
"0.1.6
"history=50 and other minor stuff
"0.1.7
"disable backups
"0.1.8 15/05/2015
"fix colours  -not version bumped on some rollouts, appears as 0.1.7
"0.1.9 05/06/2015
"added set confirm
"test

"Abort if using evim
if v:progname =~? "evim"
	finish
endif

filetype on

function CommentLines()
  "let Comment="#" " shell, tcl, php, perl
  exe ":s@^@".g:Comment."@g"
  exe ":s@$@".g:EndComment."@g"
endfunction
" map visual mode keycombo 'co' to this function
vmap co :call CommentLines()<CR>

:set nocp
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endi

set nocompatible
set autoindent
set ignorecase
set smartcase
set incsearch
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set history=50
set ruler
set showcmd		  " show incomplete commands

set copyindent    " copy the previous indentation on autoindenting
set tabstop=4     " a tab is four spaces
set shiftwidth=4  " number of spaces to use for autoindenting

set pastetoggle=<F2>

set confirm

"Backups are annoying in conf.d type areas
set nobackup

" Allow ; instead of : for commands
nnoremap ; :
" Use ,/ to clear search highlight
nmap <silent> ,/ :nohlsearch<CR>

" Allow :w!! to re-open the file with sudo
cmap w!! w !sudo tee % >/dev/null

" http://nvie.com/posts/how-i-boosted-my-vim/

" If I forget to use the ; : cmap I have a bad habit of entering :Q!
cmap Q q

" allow quick exit no save
cmap qq q!

call pathogen#infect()

""NERDTtree
" Autoload NERDTree if no file is specificed
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Disable / reenable NERDTree
map <C-n> :NERDTreeToggle<CR>
" Exit vim if only NREDTree is left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"Never re-open the same file twice
set switchbuf=useopen,usetab
"Show hidden files
let NERDTreeShowHidden=1

"Solorized colours
"git clone git://github.com/altercation/vim-colors-solarized.git
syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

