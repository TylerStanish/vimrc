set nocompatible              " be iMproved, required
set ruler
set autoread
filetype off                  " required
"set clipboard=unnamedplus
set backspace=indent,eol,start

" --- EXPERIMENTAL STUFF HERE
nnoremap <C-W>s Hmx`` \|:split<CR>`xzt``
au VimEnter *  NERDTree
" --- DONE WITH EXPERIMENTAL STUFF

"set statusline+=%F
"set laststatus=2

"set path+=**
set hlsearch
"set wildmenu
syntax on
set relativenumber
set number

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'chemzqm/vim-jsx-improve'
Plug 'sickill/vim-monokai'
"Plug 'jiangmiao/auto-pairs'
""Plug 'Vimjas/vim-python-pep8-indent'
Plug 'alvan/vim-closetag'
"Plug 'vim-syntastic/syntastic'
"Plug 'python-mode/python-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let g:closetag_shortcut = '>'
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.js,*.jsx,*.tsx"
let g:airline#extensions#tabline#enabled = 1

set tabstop=2
set shiftwidth=2
set softtabstop=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype haskell setlocal ts=2 sw=2 expandtab

set autoindent
set smartindent


set background=light
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"
let g:NERDTreeNodeDelimiter = "\u00a0"
colorscheme solarized

nnoremap _ gT
nnoremap + gt
nnoremap <leader>b :ls<CR>:b 
"inoremap {<CR>  {<CR><BS>}<Esc>O
"inoremap ( ()<Esc>i

let i = 1
while i <= 9
	execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
	let i = i + 1
endwhile

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

set laststatus=2
"statusline
hi StatusLine term=bold cterm=bold ctermfg=White ctermbg=235
hi StatusHostname term=bold cterm=bold ctermfg=107 ctermbg=235 guifg=#799d6a
hi StatusGitBranch term=bold cterm=bold ctermfg=215 ctermbg=235 guifg=#ffb964

function! MyGitBranchStyle()
    let branch = GitBranch()
    if branch == ''
        let branchStyle = ''
    else
        let branchStyle = 'git:' . branch
    end
    return branchStyle
endfunction

function! WindowNumber()
    let str=tabpagewinnr(tabpagenr())
    return str
endfunction

"append  %#StatusHostname#%{hostname()
"set statusline=%#StatusLine#%F%h%m%r\ %h%w%y\ col:%c\ lin:%l\,%L\ buf:%n\ win:%{WindowNumber()}\ reg:%{v:register}\}
