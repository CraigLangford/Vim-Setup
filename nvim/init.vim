set encoding=utf-8

" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Set clipboard to default and add mouse support
set clipboard=unnamedplus
set mouse=a

" Show a line at 99 columns for helping keep length consistent
let &colorcolumn="119"
set linespace=2

set nocompatible               " required
filetype on " required
filetype plugin on

" Set relative line number for quicker movements
set relativenumber

" Remap leader key to space for easy access
let mapleader = " "

"split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap tt <C-W><C-V>

" Tab navigations
nnoremap th :bp<CR>
nnoremap tl :bn<CR>

nnoremap <C-\> :pop<CR>

" Autosave
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Enable folding with comma
nnoremap <leader><leader> za

"set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/autoload/plug')

" Install colors for vim
Plug 'altercation/vim-colors-solarized'

" Tab closing
Plug 'moll/vim-bbye'

" Remap \wq and \q for only closing buffer
nnoremap twq :w<bar>Bdelete<CR>
nnoremap tq :Bdelete<CR>

Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" Multi-entry selection UI.
Plug 'junegunn/fzf'

nnoremap <c-p> :FZF<cr>

" Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'
let g:echodoc_enable_at_startup=1
set noshowmode

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['pyls'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

autocmd BufNewFile,BufRead *.py set foldmethod=syntax

" Add nerdtree to navigate files
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']
" Don't start nerdtree on startup
let g:nerdtree_tabs_open_on_gui_startup=0

" Disable highlighting of exec files
highlight link NERDTreeExecFile None

" Shows files' git status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" autocmd vimenter * NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" Check for diffs in current file
Plug 'airblade/vim-gitgutter'
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '▪'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_modified_removed = '_'

" Powerline for VIM
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Powerline always enabled
set laststatus=2

" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1

" Allow airline tow work with syntastic2
if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = '∥'
let g:airline_symbols.readonly = ''
let g:airline_symbols.whitespace = 'Ξ'

set nu

Plug 'tpope/vim-fugitive'
set diffopt+=vertical

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = "<c-b>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsListSnippets        = "<c-e>" "List possible snippets based on current file

Plug 'honza/vim-snippets'

" Add comment capabilities
Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Easy grep! No more need for fancy searches
Plug 'dkprice/vim-easygrep'
let g:EasyGrepCommand=1
let g:EasyGrepRecursive=1
let g:EasyGrepDefaultUserPattern="*.py *.json, *.txt, *.sh, *.md"
let g:EasyGrepMode='User'
let g:EasyGrepFilesToExclude="docs,.git"

" Colorcode the nerdtree glyphs - not currently working in gvim
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
let g:NERDTreeLimitedSyntax = 1

" Dev Icons
Plug 'ryanoasis/vim-devicons'
" the amount of space to use after the glyph character
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" Remove extra padding
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

call plug#end()

" Change colorscheme
syntax enable
autocmd BufEnter * :syntax sync fromstart
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
hi Visual ctermbg=NONE

" Add bold to class and def statements
hi Statement ctermfg=100 ctermbg=NONE cterm=bold guifg=#859900 guibg=NONE gui=bold

" Set split as a vertical line
set fillchars+=vert:\│
hi! VertSplit ctermbg=NONE guibg=NONE

set modelines=0
set nomodeline

" Turn of tabs for current project
filetype plugin indent off
"set autoindent noexpandtab tabstop=4 shiftwidth=4
set tabstop=8 expandtab shiftwidth=4 softtabstop=4 " PEP8
" Show tabs
" set list listchars=tab:→\ ,trail:·
set list listchars=tab:\·\ ,trail:·
hi! link SpecialKey Comment

" Allow yanking to clipboard
nnoremap yy yy"+yy
vnoremap y ygv"+y

" jump to previous class
nnoremap <leader>b :call PythonDec("class", -1)<CR>
vnoremap <leader>b :call PythonDec("class", -1)<CR>

" jump to next class
nnoremap <leader>f :call PythonDec("class", 1)<CR>
vnoremap <leader>f :call PythonDec("class", 1)<CR>

" jump to previous function
nnoremap <leader>B :call PythonDec("function", -1)<CR>
vnoremap <leader>B :call PythonDec("function", -1)<CR>

" jump to next function
nnoremap <leader>F :call PythonDec("function", 1)<CR>
vnoremap <leader>F :call PythonDec("function", 1)<CR>

" Go to previous (-1) or next (1) class/function definition
function! PythonDec(obj, direction)
  if (a:obj == "class")
    let objregexp = "^\\s*class\\s.*"
  else
    let objregexp = "^\\s*def\\s.*"
  endif
  let flag = "W"
  if (a:direction == -1)
    let flag = flag."b"
  endif
  let res = search(objregexp, flag)
endfunction

" Disable any column highlighting
hi SignColumn   ctermbg=none
hi LineNr       ctermbg=none
hi CursorLineNr cterm=bold   ctermfg=White

" Remove search highlighting
set nohlsearch

"Make git gutter icons bright and bold
hi GitGutterAdd          cterm=bold ctermfg=46
hi GitGutterChange       cterm=bold ctermfg=165
hi GitGutterChangeDelete cterm=bold ctermfg=1
hi GitGutterDelete       cterm=bold ctermfg=1
