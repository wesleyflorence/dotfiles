" Vim-plug setup
"==============================================================
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
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
highlight clear SignColumn " Makes the gutter transparent

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
" This function NERDTreeToggles unless you're in a file in which case it
" highlights the file you're editing in the tree
function! NERDTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nnoremap <C-f> :call NERDTreeToggleFind()<CR> "ctrl-f for nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open
let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0

" Wildmenu stuff
set wildmenu
set wildignore+=*.bmp,*.gif,*.jpg,*.png,*.ico " Don't offer to open certain files/directories
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*

" Folding
set foldmethod=indent " not as cool as syntax, but faster
set foldlevelstart=1 " start unfolded

" Buffers
nnoremap <C-a> :ls<CR>:b<space>

" Git-gutter
set updatetime=300
let g:gitgutter_sign_added              = '▐'
let g:gitgutter_sign_modified           = '▐'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'

" FZF files
nnoremap <C-p> :Files<Cr> " fuzzy find file path
nnoremap <C-_> :Rg<Cr> " Ripgrep contents

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

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
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

" Adding JFlex Syntax for compilers project
augroup filetype
  au BufRead,BufNewFile *.flex,*.jflex    set filetype=jflex
augroup END
au Syntax jflex    so ~/.vim/syntax/jflex.vim

autocmd BufNewFile,BufRead *.cup setf cup
