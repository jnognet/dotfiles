call plug#begin()

  " Temas
  Plug 'drewtempelmeyer/palenight.vim'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes' 

  " Adicionar syntax hightlight para várias linguagens
  Plug 'sheerun/vim-polyglot'

  " Caracteres especiais para indentação
  Plug 'Yggdroot/indentLine'

  " Emmet
  Plug 'mattn/emmet-vim'

  " barra de navegação por arquivos e diretórios
  Plug 'preservim/nerdtree'

  Plug 'neoclide/coc.nvim', {'branch': 'release'}  

  Plug 'ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

  " === 
  " Início da instalação do fzf
  " O fzf serve para fazer buscas no estilo do sublime text, com Ctrl + P
  " Antes de instalar, leia a documentação e instale as dependências
  " necessárias.
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } 
  Plug 'junegunn/fzf.vim'
  " Final da instalação do fzf
  " ===  

  Plug 'cohama/lexima.vim'

  Plug 'jiangmiao/auto-pairs'

  Plug 'mg979/vim-visual-multi', {'branch': 'master'}

call plug#end()

set encoding=UTF-8

" Habilita syntax highlight
syntax on

" Define o background para temas escuros. Usar `light` para temas claros
set background=dark

" [TEMA] Configurações para tema palenight -----------------------------------

set termguicolors

" Define o tema
colorscheme palenight

" Configurações do plugin Airline --------------------------------------------

" Permitir fontes Powerline
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.notexists = ' ✗'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_theme='palenight'

" Configurações do Vim IndentGuides

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

" Fim das configurações do Vim IndentGuides

" Define se a cor usada pelo indentLine vai seguir o tema (0) ou o padrão do
" indentLine (1), que é cinza
let g:indentLine_setColors = 1

" Define a cor da linha
let g:indentLine_color_term = 237

" Exemplos de linhas verticais: | ¦ ┆ ┊ ▏
let g:indentLine_enabled = 1
let g:indentLine_char = '¦'
let g:indentLine_first_char = '¦'
let g:indentLine_showFirstIndentLevel = 1

" Configurações do CoC.nvim

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Fim das configurações do CoC.nvim

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-l> :NERDTreeToggle<CR>

nnoremap <silent> <C-f> :Files<CR>

"Espaços e Tabs -------------------------------------------------------------

" Define tabs como espaços
set expandtab

" Número de espaços visuais ao pressionar a tecla TAB
set tabstop=2

" Número de espaços contados em uma tabulação quando estiver editando
set softtabstop=2

" Número de espaços contados em uma tabulação em nova linha
set shiftwidth=2

" UI e Layout ----------------------------------------------------------------

" Exibir uma coluna para marcar 80 espaços
set colorcolumn=80

" Marcar linha atual
set cursorline

" exibir números de linhas
set number

" exibir números de linha acima ou abaixo relativos a linha atual
" set relativenumber

" Habilita a exibição de caracteres ocultos
set list 

" Define como os símbolos ocultos serão representados
set listchars=tab:▸\
set listchars+=trail:·
set listchars+=eol:↴
set listchars+=nbsp:_

" Pode deixar o nvim lento, mas garantido que syntax highlight vai 
" sempre funcionar
autocmd BufEnter * :syntax sync fromstart

" Habilita o mouse no modo de inserção
" i = insert
" v = visual
" a = all (todos os modos)
set mouse=a
