"    _   __                                __ __ __                  ___          __  
"   / | / /___ ___  ____  _____  ____     / //_// /_  ____ ______   /   |  ____  / /_ 
"  /  |/ / __ `/ / / / / / / _ \/ __ \   / ,<  / __ \/ __ `/ ___/  / /| | / __ \/ __ \
" / /|  / /_/ / /_/ / /_/ /  __/ / / /  / /| |/ / / / /_/ / /__   / ___ |/ / / / / / /
"/_/ |_/\__, /\__,_/\__, /\___/_/ /_/  /_/ |_/_/ /_/\__,_/\___/  /_/  |_/_/ /_/_/ /_/ 
"      /____/      /____/                                                             
"
" Vim customized by Nguyen Khac Anh (APT_3233)
"
"     "https://www.facebook.com/Anh0242/"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                 " Enable mouse
set tabstop=2               " 
set shiftwidth=2            " 
set expandtab
set listchars=tab:\¦\       " Tab charactor 
set list
set foldmethod=syntax       " 
set foldnestmax=1
set foldlevelstart=0        "  
set number                  " Show line number
set ignorecase              " Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize 
set synmaxcol=200
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used with Vim-plug - https://github.com/junegunn/vim-plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Theme
"  Plug 'joshdick/onedark.vim',                  " Dark theme
  Plug 'folke/tokyonight.nvim'
  Plug 'itchyny/lightline.vim'

" Terminal colors
  Plug 'altercation/vim-colors-solarized'

" Title 
  Plug 'vim-airline/vim-airline'

" File browser
  Plug 'preservim/nerdTree'                     " File browser  
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'tiagofumo'
          \ .'/vim-nerdtree-syntax-highlight'
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 

" File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

" Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

" Code intellisense
  Plug 'neoclide/coc.nvim', 
    \ {'branch': 'release'}                     " Language server protocol (LSP) 
  Plug 'pappasam/coc-jedi',                     " Jedi language server 
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto 
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim' 
  Plug 'preservim/nerdcommenter'                " Comment code 
  Plug 'liuchengxu/vista.vim'                   " Function tag bar 
  Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
    \ { 
      \ 'do': 'yarn install '
              \ .'--frozen-lockfile '
              \ .'&& yarn build',
      \ 'branch': 'main' 
    \ }

" Code syntax highlight
  Plug 'yuezk/vim-js'                           " Javascript
  Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
  Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
  Plug 'uiiaoo/java-syntax.vim'                 " Java
  
" Debugging
  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
  Plug 'tpope/vim-fugitive'                     " Git infomation 
  Plug 'tpope/vim-rhubarb' 
  Plug 'airblade/vim-gitgutter'                 " Git show changes 
  Plug 'samoshkin/vim-mergetool'                " Git merge
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set Title
let g:airline_powerline_fonts = 1  
" phai git clone https://github.com/powerline/fonts.git --> ./install.sh

" Set theme 
syntax on
colorscheme tokyonight

"
let g:tokyonight_style = "storm"
let g:tokyonight_italic_functions = 1
let g:tokyonight_transparent = 1
let g:tokyonight_hide_inactive_statusline = 1


" Overwrite some color highlight
let s:palette = v:lua.require('lightline.colorscheme.tokyonight')
let g:lightline#colorscheme#tokyonight#palette = lightline#colorscheme#fill(s:palette)

"highlight background transparent for nvim
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE


"Others Setting
nnoremap <silent><F2> :NERDTreeFind<CR>
nnoremap <silent><F3> :NERDTreeToggle<CR>

