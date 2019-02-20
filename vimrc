" vim-plug as the plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', {'rtp': 'vim/'}      " color theme
Plug 'ctrlpvim/ctrlp.vim'                  " find files with ctrl+p
Plug 'ervandew/supertab'                   " Upgrade vim's omnicomplete
Plug 'mattn/gist-vim'                      " quickly put code into a gist
Plug 'mattn/webapi-vim'                    " quickly put code into a gist
Plug 'mxw/vim-jsx'                         " syntax highlighting for react
Plug 'pangloss/vim-javascript'             " do js stuff
Plug 'prettier/vim-prettier'               " code formatting
Plug 'scrooloose/nerdcommenter'            " easy commenting
Plug 'scrooloose/nerdtree'                 " find files by dir tree
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'                  " git integration
Plug 'tpope/vim-surround'                  " surround with tags
Plug 'vim-airline/vim-airline'             " status bar plugin
Plug 'w0rp/ale'                            " syntax checking
call plug#end()

" map leader to spacebar (best thing ever)
let mapleader = ' '

" theme
syntax enable           " Enable code highlighting
set guifont=Monaco:h14
set guioptions-=r
set termguicolors
set background=dark
colorscheme onehalfdark

" line Numbers
set number
set numberwidth=2
set laststatus=2

" search stuff
set incsearch
set gdefault
set visualbell

" characters and movement
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set backspace=indent,eol,start
set title

" split windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" set one directory for .swp files
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp

" Airline / Status line options
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1

" LESS / CSS Highlighting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" JSX highlighting in regular .js files
let g:jsx_ext_required = 0

" vim-prettier options
noremap <leader>f :PrettierAsync<CR>

" Ctrl-P options
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " make ctrl-p ignore things in .gitignore
noremap <leader>s :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

" NERDCommenter options
let g:NERDCustomDelimiters = { 'less': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' }, 'javascript': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' } }

" NERDTree options
noremap <leader>t :NERDTreeToggle<CR>

" ALE options
noremap <leader>r :ALEFindReferences<CR>
noremap <leader>d :ALEGoToDefinition<CR>
let g:ale_completion_enabled = 1
set completeopt=longest,menuone
let g:ale_lint_on_text_changed = 'normal'
let g:LanguageClient_serverCommands = { 'javascript': ['/usr/local/bin/javascript-typescript-stdio'] }
let g:SuperTabDefaultCompletionType = "<c-n>"
"highlight ALEErrorSign term=bold cterm=NONE ctermfg=red ctermbg=NONE gui=NONE guifg=red guibg=NONE
"highlight ALEWarningSign term=bold cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=yellow guibg=NONE
"highlight clear SignColumn
