set encoding=utf-8

" Auto reload .vimrc
autocmd! bufwritepost .vimrc source %

" Set clipboard to default
set clipboard=unnamedplus

" Show a line at 99 columns for helping keep length consistent
let &colorcolumn="72,99"
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

" Enable folding
set foldlevel=50

" Enable folding with comma
nnoremap "," za

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
" Plug 'vim-syntastic/syntastic'

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 1
" let g:syntastic_warning_symbol = '▶'
" let g:syntastic_error_symbol = '▶'
" exec 'hi SyntasticErrorSign guifg=red ctermfg=red ' (has("gui_running")? 'guibg=':'ctermbg=') synIDattr(hlID('SignColumn'),'bg')

Plug 'w0rp/ale'

" Disable most format checking
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_checkers=['pyflakes']
" let g:syntastic_python_flake8_args='--ignore=E501'
" let g:syntastic_htmldjango_checkers=['jshint']

Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1
set foldmethod=indent

" Install NeoAutocompleter
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
" Close preview window after an option is selected
autocmd CompleteDone * pclose
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
let g:tern#filetypes = ['js', 'html'] "Add extra filetypes

" Add nerdtree to navigate files
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Ignore .pyc files
let NERDTreeIgnore = ['\.pyc$']
" Don't start nerdtree on startup
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Disable highlighting of exec files
highlight link NERDTreeExecFile None

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
colorscheme solarized
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

let g:ale_sign_warning='●'
hi ALEErrorSign ctermfg=Red ctermbg=none
let g:ale_sign_error='●'
hi ALEWarningSign ctermfg=LightYellow ctermbg=none
let g:airline#extensions#ale#enabled = 1
hi LineNr ctermbg=none
hi CursorLineNr cterm=bold ctermfg=White
hi SignColumn ctermbg=none

" Remove search highlighting
set nohlsearch
