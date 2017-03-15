cd ~/Project Path

set lines=999 columns=999
set guioptions -=T

set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_powerline_fonts = 1

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

exec 'hi SyntasticErrorSign guifg=red ctermfg=red' .
            \' guibg=' . synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'gui') .
            \' ctermbg=NONE' . synIDattr(synIDtrans(hlID('SignColumn')), 'bg', 'cterm')
