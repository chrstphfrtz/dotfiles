call plug#begin('~/.vim/plugged')

" Aesthetics
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Functionality
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Set gruvbox colorscheme and airline theme
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_termcolors = 256
let g:airline_theme='gruvbox'

" Requirements for vimwiki
set nocompatible
syntax on
filetype plugin indent on

" Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Textwidth 100
set textwidth=100

" Enable relative numbers
set relativenumber
set rnu

" Set colorcolumn
set colorcolumn=100

" Set custom keybindings
nnoremap <esc> :noh<return><esc>
nnoremap :W<cr> :w<cr>
nnoremap <C-s> :w<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
map <Space> :w<Enter>:!!<Enter>

" NerdTREE
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" NercCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" Vimwiki
let g:vimwiki_list = [{'path': '~/repos/notes/', 'path_html': '~/repos/notes/html/'}]

" FZF Config
nnoremap <C-p> :Files<cr>
nnoremap <C-b> :Buffers<cr>
nnoremap <C-g> :Rg<cr>

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
let g:fzf_preview_window = ''

" Auto generate tags file on file write of *.c and *.h files
autocmd BufWritePost *.c,*.h silent! !ctags . &
