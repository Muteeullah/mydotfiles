"Installed Plugins  
"Nerdtree, Syntastic, vim-airline, vim-airline-theme,
"vim-bufferline, vim-fugitive, vim-gitgutter, vim-sensible, vim-surround,
"vim-easy-align, comfortable-motion, 

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
set nocompatible 
execute pathogen#infect()
set number
syntax on
filetype plugin indent on
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
set hidden
set history=100
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent
set hlsearch
set showmatch
let g:airline#extensions#tabline#enabled = 1
map <leader>\ :NERDTreeToggle<CR>
map <up> :echoerr "Stop being stupid and use k"<CR>
map <down> :echoerr "Stop being stupid and use j"<CR>
map <left> :echoerr "Stop being stupid and use h"<CR>
map <right> :echoerr "Stop being stupid and use l"<CR>

"TABS MAPPING
nnoremap tn : tabnew<Space>
nnoremap tl : tabnext<CR>
nnoremap th : tabprev<CR>
