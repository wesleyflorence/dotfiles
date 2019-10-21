" Vim-plug setup
"==============================================================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
"==============================================================

" Aestetics
" Forcing vim to use default terminal colorscheme
set t_Co=256
set term=xterm
let &t_AB="\e[48;5;%dm"    "These lines hide two colors vim was set on including for some reason
let &t_AF="\e[38;5;%dm"
syntax on "highlght syntax
hi Normal guibg=NONE ctermbg=NONE "Sets vim background to transparnt

" Sensible stuff
set nocompatible
set mouse=a "use the mouse like a baby
set number relativenumber "relative line numbers
set clipboard=unnamed " use os clipboard
set smartindent
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
set incsearch "searches as characters are entered
set hlsearch "highlight matches
set showmatch "highlight matching [{()}]
set backspace=indent,eol,start "allows backspacing in insert mode
set splitbelow
set splitright

" Airline
let g:airline_theme = 'luna'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1

" Show cursorline when in insert mode
highlight  CursorLine  cterm=NONE ctermbg=Black ctermfg=None
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline

" NERDTree
nnoremap <C-f> :NERDTreeToggle<CR> "ctrl-f for nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open

" Wildmenu stuff
set wildmenu
set wildignore+=*.bmp,*.gif,*.jpg,*.png,*.ico " Don't offer to open certain files/directories
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*

" Folding
set foldmethod=indent " not as cool as syntax, but faster
set foldlevelstart=1 " start unfolded

" Coc.nvim default settings
" ============================================
set hidden " if hidden is not set, TextEdit might fail.
set cmdheight=2 " Better display for messages
set updatetime=300 " Smaller updatetime for CursorHold & CursorHoldI
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show signcolumns

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" ============================================

" Auto Open the quickfix window when grepping
augroup autoquickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost    l* lwindow
augroup END

" Switch to left / right split (mostly for Nerd Tree)
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

