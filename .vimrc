set nocompatible              " be iMproved, required
set ruler
filetype off                  " required

"set statusline+=%F
"set laststatus=2

"set path+=**
"set hlsearch
"set wildmenu
syntax on
set relativenumber
set number

set tabstop=2
set shiftwidth=2
set softtabstop=2
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
call plug#end()

set background=light
let g:solarized_contrast = "high"
let g:solarized_visibility = "high"
let g:NERDTreeNodeDelimiter = "\u00a0"
colorscheme solarized

nnoremap , gT
nnoremap . gt

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

set laststatus=2
"append  %#StatusHostname#%{hostname()
set statusline=%#StatusLine#%F%h%m%r\ %h%w%y\ col:%c\ lin:%l\,%L\ buf:%n\ win:%{WindowNumber()}\ reg:%{v:register}\}
