set fileencodings=ucs-bom,utf-8,iso-2022-jp,sjis,cp932,euc-jp,cp20932
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set backspace=2
set smartindent
let autoindent = 1
set ignorecase
set number
set nowrap
set laststatus=2
set showtabline=2
set hlsearch
set incsearch
set list
set listchars=tab:>-,trail:-
set wildmenu
set wildmode=list:full
set noswapfile
set nobackup
set visualbell t_vb=
set clipboard+=unnamed
set listchars=eol:↲

let mapleader = ' '
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabprev<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
 
" Disable Arrow keys
" :EnableArrowKeys command enables them
nnoremap <Up>    <Nop>
nnoremap <Down>  <Nop>
nnoremap <Left>  <Nop>
nnoremap <Right> <Nop>
 
function! EnableArrowKeys()
  nnoremap <Up>    <Up>
  nnoremap <Down>  <Down>
  nnoremap <Left>  <Left>
  nnoremap <Right> <Right>
endfunction
 
function! DisableArrowKeys()
  nnoremap <Up>    <Nop>
  nnoremap <Down>  <Nop>
  nnoremap <Left>  <Nop>
  nnoremap <Right> <Nop>
endfunction
 
command! -nargs=1 -complete=file Rename call rename(expand('%'), '<args>') | e <args>
command! -nargs=1 -complete=help Vh :vertical belowright help <args>
command! Indent2 :setlocal tabstop=2 shiftwidth=2
command! Indent4 :setlocal tabstop=4 shiftwidth=4
command! ToSjis :e ++enc=sjis<CR>
command! EnableArrowKeys :call EnableArrowKeys()
command! DisableArrowKeys :call DisableArrowKeys()
 
" NeoBundle
 
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
 
call neobundle#rc(expand('~/.vim/bundle/'))
 
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'
 
filetype plugin indent on
 
" neocomplete
 
if neobundle#is_installed('neocomplete')
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#min_keyword_length = 3
 
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
 
  inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
endif
 
" NERDTree
 
if neobundle#is_installed('nerdtree')
  let NERDTreeShowHidden = 1
  let NERDTreeMinimalUI = 1
  map <Leader>e :NERDTreeToggle<CR>
endif
 
" Load local settings
 
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

colorscheme jellybeans
