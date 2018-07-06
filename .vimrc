"Installed Plugins  
"Nerdtree, Syntastic, vim-airline, vim-airline-theme,
"vim-bufferline, vim-fugitive, vim-gitgutter, vim-sensible, vim-surround,
"vim-easy-align, comfortable-motion, 


set nocompatible 
execute pathogen#infect()
set number
syntax on
filetype plugin indent on
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
set hidden
set history=10000
filetype indent on
set nowrap
set incsearch
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

"Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"let g:ale_completion_enabled = 1

"Uncomment autocmd line to show DOCS and comment completeopt line.
set completeopt-=preview
"autocmd CompleteDone * pclose

"Tab mapping for emmet
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_expandabbr_key='<Tab>'
