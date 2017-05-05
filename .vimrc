" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Set clipboard to default
set clipboard=unnamedplus

" Show a line at 99 columns for helping keep length consistent
let &colorcolumn="72,99"

set nocompatible               " required
filetype on " required
filetype plugin on

" Set relative line number for quicker movements
set relativenumber

" Remap leader key to comma for easy access
let mapleader = ','

" Search for highlighted word by ctrl-s
nnoremap <C-W> yiw/<C-R>"<CR>

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

" Enable folding
set foldlevel=50

" Enable folding with the spacebar
nnoremap <space> za

"set the runtime path to include Vundle and initialize

call plug#begin('~/.vim/autoload/plug')

" Install colors for vim
Plug 'altercation/vim-colors-solarized'

" Tab closing
Plug 'moll/vim-bbye'

" Remap \wq and \q for only closing buffer
nnoremap twq :w<bar>Bdelete<CR>
nnoremap tq :Bdelete<CR>

" Syntax checking
Plug 'vim-syntastic/syntastic'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_warning_symbol = '▶'
let g:syntastic_error_symbol = '▶'
exec 'hi SyntasticErrorSign guifg=red ctermfg=red ' (has("gui_running")? 'guibg=':'ctermbg=') synIDattr(hlID('SignColumn'),'bg')

" Disable most format checking
" let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_python_flake8_args='--ignore=E,W'
let g:syntastic_htmldjango_checkers=['jshint']

Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
set foldmethod=indent

set encoding=utf-8

" Install YCM for autocomplete
Plug 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Add nerdtree to navigate files
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']
" Don't start nerdtree on startup
let g:nerdtree_tabs_open_on_gui_startup=0

" Shows files' git status in nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
" autocmd vimenter * NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

" For searching current file tree
Plug 'kien/ctrlp.vim'
"" Ignore pyc files
set wildignore+=*.pyc
set wildignore+=*docs/*

" Check for diffs in current file
Plug 'airblade/vim-gitgutter'

" Powerline for VIM
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Powerline always enabled
set laststatus=2

" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline_powerline_fonts = 1

" Allow airline tow work with syntastic2
if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

set nu

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger       = "<c-b>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
let g:UltiSnipsListSnippets        = "<c-e>" "List possible snippets based on current file

Plug 'honza/vim-snippets'

Plug 'bingaman/vim-sparkup'

Plug 'vim-scripts/taglist.vim'
nnoremap <silent> <c-t> :TlistToggle<CR>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 50

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
let g:EasyGrepDefaultUserPattern="*.py *.html"
let g:EasyGrepMode='User'
let g:EasyGrepFilesToExclude="docs,.git"

" Javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
imap <C-c> <CR><Esc>O
Plug 'marijnh/tern_for_vim'

" Markdown editing
Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_github=1
let vim_markdown_preview_temp_file=0

call plug#end()

" Change colorscheme
syntax enable
set background=dark
colorscheme solarized
" Add bold to class and def statements
hi Statement ctermfg=100 ctermbg=NONE cterm=bold guifg=#859900 guibg=NONE gui=bold

set modelines=0
set nomodeline

" Turn of tabs for current project
filetype plugin indent off
set autoindent noexpandtab tabstop=4 shiftwidth=4
"set tabstop=8 expandtab shiftwidth=4 softtabstop=4 " PEP8
" Show tabs
" set list listchars=tab:→\ ,trail:·
set list listchars=tab:\|\ ,trail:·
hi! link SpecialKey Comment

" Allow yanking to clipboard
nnoremap yy yy"+yy
vnoremap y ygv"+y

" jump to previous class
nnoremap ,b :call PythonDec("class", -1)<CR>
vnoremap ,b :call PythonDec("class", -1)<CR>

" jump to next class
nnoremap ,f :call PythonDec("class", 1)<CR>
vnoremap ,f :call PythonDec("class", 1)<CR>

" jump to previous function
nnoremap ,B :call PythonDec("function", -1)<CR>
vnoremap ,B :call PythonDec("function", -1)<CR>

" jump to next function
nnoremap ,F :call PythonDec("function", 1)<CR>
vnoremap ,F :call PythonDec("function", 1)<CR>

" Go to previous (-1) or next (1) class/function definition
function! PythonDec(obj, direction)
  if (a:obj == "class")
    let objregexp = "^\\s*class\\s\\+[a-zA-Z0-9_]\\+"
        \ . "\\s*\\((\\([a-zA-Z0-9_,. \\t\\n]\\)*)\\)\\=\\s*:"
  else
    let objregexp = "^\\s*def\\s\\+[a-zA-Z0-9_]\\+\\s*(\\_[^:#]*)\\s*:"
  endif
  let flag = "W"
  if (a:direction == -1)
    let flag = flag."b"
  endif
  let res = search(objregexp, flag)
endfunction
