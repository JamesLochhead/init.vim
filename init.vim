"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'preservim/nerdtree'      		" File navigation in a left pane
Plug 'vim-airline/vim-airline'		" Nicer bottom status line with git branch
Plug 'vim-airline/vim-airline-themes'   " Themes for the above
Plug 'dense-analysis/ale'		" Async linting, code completion, etc
Plug 'thaerkh/vim-indentguides'		" Indent guides for code blocks
Plug 'moll/vim-bbye'			" Enables some commands that improve NERDTree
Plug 'plasticboy/vim-markdown'		" Vim markdown syntax highlighting
Plug 'godlygeek/tabular'		" Need for vim-markdown table formatting
Plug 'ParamagicDev/vim-medic_chalk'     " Theme
Plug 'koalaman/shellcheck'		" Bash/sh linter
Plug 'Xuyuanp/nerdtree-git-plugin'	" Git status in NERDTree
Plug 'altercation/vim-colors-solarized' " Solarized theme
call plug#end()
" moll/vim-bbye allows buffers to be closed without closing windows, hence
" keeping vim open when a buffer needs to be closed. The command is :Bd.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General options                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number				" Turn on line numbers
set mouse=a				" Turn on mouse mode
colorscheme solarized			" Set the color scheme
set termguicolors			" Enable True Color

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File type specific                                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sane tabs for YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree                                                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Shortcut for NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close NERDTree when it is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" If Neovim starts with no open files, open NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree and another window when a folder is opened in Neovim
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Make NerdTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline                                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show a line for tabs and buffers
let g:airline#extensions#tabline#enabled = 1

" Theme for vim-airline 
let g:airline_theme='minimalist'

let g:airline#extensions#tabline#formatter = 'unique_tail'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE                                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on code completion; turn off if using another source
let g:ale_completion_enabled = 1
let b:ale_fixers = {
\ 'javascript': ['prettier', 'eslint'],
\ 'yaml': ['prettier'],
\ 'json': ['prettier'],
\ 'sh': ['shfmt'],
\ 'python': ['autopep8'],
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts                                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader = ,
let mapleader = ","

" ,w = attempt to save with sudo
noremap <Leader>w :w !sudo tee % > /dev/null

" Prettify JSON with jq
noremap <Leader>j :%!jq '.'

" Next buffer
noremap <Leader>n :bn

" Previous buffer
noremap <Leader>p :bp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-markdown                                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable vim markdown code folding
let g:vim_markdown_folding_disabled = 1

" Disable code block concealment
let g:vim_markdown_conceal_code_blocks = 0

" Highlight Jekyll and Hugo front matter
let g:vim_markdown_frontmatter = 1

" Enable strikethrough
let g:vim_markdown_strikethrough = 1

" Number of spaces that are inserted when o is pressed in a list
let g:vim_markdown_new_list_item_indent = 0

" Disable automatic inseration of bullets
let g:vim_markdown_auto_insert_bullets = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacOS                                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
set clipboard=unnamed


" Disable quote concealing in JSON files
let g:vim_json_conceal=0
