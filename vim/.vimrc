" =====================================================================
"  My vimrc — managed in ~/dotfiles (stow package: vim)
" =====================================================================
"  CHEAT SHEET — my custom shortcuts (leader = Space)
"    Space w      save              Space q      quit
"    Space e      file sidebar      Space t      terminal (bottom)
"    Space r      run Python file   Space h      clear search highlight
"    Space v      reload this vimrc
"    Ctrl-h/j/k/l move between split windows
"  Built-in things worth remembering:
"    Ctrl-n       autocomplete word (in insert mode)
"    :vsplit f    open file f side by side      :split f   above/below
"    u / Ctrl-r   undo / redo (undo survives closing the file!)
" =====================================================================

" ---------- Basics ----------
set nocompatible              " use Vim features, not old-vi behaviour
filetype plugin indent on     " per-language settings + smart indenting
syntax on                     " syntax highlighting
set encoding=utf-8
set hidden                    " switch files without being forced to save
set backspace=indent,eol,start " backspace works like you'd expect
set autoread                  " reload a file if it changed outside Vim
set ttimeoutlen=50            " Esc reacts instantly (helps over SSH)
set updatetime=300            " faster background updates
set belloff=all

" ---------- Look ----------
set number                    " line numbers...
set relativenumber            " ...counted from the cursor (great for 5j, 3dd)
set cursorline                " highlight the current line
set laststatus=2              " always show the status bar
set ruler                     " cursor position in status bar
set showcmd                   " show keys as you type a command
set scrolloff=5               " keep 5 lines visible above/below cursor
set wildmenu                  " visual menu when Tab-completing :COMmands
set wildmode=longest:full,full
set list listchars=tab:»\ ,trail:·   " show tabs and trailing spaces (Python cares!)
set background=dark
silent! colorscheme gruvbox   " nice theme (silent! = no error if missing)
let g:gruvbox_contrast_dark = "hard"

" ---------- Mouse (works over SSH) ----------
set mouse=a                   " click, scroll, drag split borders
silent! set ttymouse=sgr      " mouse works in wide terminal windows too

" ---------- Search ----------
set incsearch                 " jump to matches while typing
set hlsearch                  " highlight all matches
set ignorecase smartcase      " case-insensitive unless you type a capital

" ---------- Indentation (4 spaces, PEP 8) ----------
set expandtab                 " Tab key inserts spaces
set tabstop=4 shiftwidth=4 softtabstop=4
set autoindent

" ---------- Windows ----------
set splitbelow splitright     " new splits open below / to the right

" ---------- Completion (Ctrl-n) ----------
set completeopt=menuone,longest
set shortmess+=c              " no noisy completion messages

" ---------- Undo & swap files (kept OUT of your projects) ----------
for s:dir in ['undo', 'swap']
  if !isdirectory($HOME . '/.vim/' . s:dir)
    call mkdir($HOME . '/.vim/' . s:dir, 'p')
  endif
endfor
set undofile                  " undo history survives closing the file
set undodir=~/.vim/undo//
set directory=~/.vim/swap//

" ---------- File explorer (built-in netrw) ----------
let g:netrw_banner = 0        " hide the help banner
let g:netrw_liststyle = 3     " tree view
let g:netrw_winsize = 25      " sidebar takes 25% width
let g:netrw_browse_split = 4  " open files in the window you came from

" ---------- Leader shortcuts ----------
let mapleader = " "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>t :botright terminal ++rows=12<CR>
nnoremap <leader>v :source $MYVIMRC<CR>:echo "vimrc reloaded"<CR>

" Move between splits with Ctrl + h/j/k/l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
