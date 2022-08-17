call plug#begin()

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-vinegar'

Plug 'vim-airline/vim-airline'

Plug 'neoclide/coc.nvim', {'branch' : 'release'}

Plug 'csliu/a.vim'

call plug#end()


filetype indent plugin on
set omnifunc=ale#completion#OmniFunc

set completeopt=longest,menuone,popuphidden
set completepopup=highlight:NONE

highlight Pmenu ctermbg=Black ctermfg=White
highlight PmenuSel ctermbg=Black ctermfg=LightBlue

let maplocalleader = "\\"
let mapleader = ","
let $MYVIMRC = "~/nixfiles/vimrc"
set encoding=utf-8 fileencodings=
syntax on

inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
noremap - ddp
noremap _ ddkP
inoremap <c-u> <esc>lvwUa
nnoremap <c-U> v$U<esc>
nnoremap <leader>ev :vs $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ss :A<cr>

set cc=80
set number
set relativenumber
set cinoptions+=:0
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set smarttab
set smartindent
set textwidth=80
set backspace=eol,start,indent
set clipboard=unnamedplus
set belloff=all

iabbrev lsit list
iabbrev tset test

" Make configuration
autocmd Filetype make setlocal noexpandtab

" C++ shortcut
autocmd Filetype cpp iabbrev cout std::cout
autocmd Filetype cpp iabbrev cin std::cin
autocmd Filetype cpp iabbrev cerr std::cerr
autocmd Filetype cpp iabbrev clog std::clog

set list listchars=tab:»·,trail:·

" C# configuration
autocmd Filetype cs nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>

" a.vim config
let g:alternateExtensions_cc = "hh"
let g:alternateExtensions_hh = "cc"
let g:alternateExtensions_hxx = "hh"

" Coc configuration
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" per .git vim configs
" just `git config vim.settings "expandtab sw=4 sts=4"` in a git repository
" change syntax settings for this repository
let git_settings = system("git config --get vim.settings")
if strlen(git_settings)
	exe "set" git_settings
endif
