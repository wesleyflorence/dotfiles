" vim-plug setup
"==============================================================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
"Plug 'tpope/vim-fugitive'
"Plug 'Valloric/YouCompleteMe'
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"===============================================================
set t_Co=256
syntax on "highlght syntax
colorscheme gruvbox
"Sets vim background to transparent since gruvbox was slightly off
hi Normal guibg=NONE ctermbg=NONE
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set nocompatible
"set number "show line numbers
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

set wildmenu
" Don't offer to open certain files/directories
set wildignore+=*.bmp,*.gif,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*

" coc.nvim default settings
" ============================================
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
"set signcolumn=yes

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

"NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open

map <C-f> :NERDTreeToggle<CR>

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" airline
"let g:airline_theme = 'minimalist'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1 
"set laststatus=2 " for airline

