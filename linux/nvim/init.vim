" Configuration for Neovim
call plug#begin()
Plug 'tomasr/molokai'
" for quick Align
Plug 'junegunn/vim-easy-align'
" for status line 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'Lokaltog/vim-powerline'
" for quick pairs bracket
Plug 'jiangmiao/auto-pairs'
" quick comment
Plug 'scrooloose/nerdcommenter'
" git blame history
Plug 'zivyangll/git-blame.vim'
" quick format comment
Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 'Valloric/YoucompleteMe'
Plug 'airblade/vim-gitgutter'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" async grammar check
Plug 'neomake/neomake'
Plug 'tczengming/autoload_cscope.vim'

Plug 'altercation/vim-colors-solarized'
call plug#end()

" Colorscheme
colorscheme molokai
let g:rehash256 = 1
" set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256


" airline timeout between switch insert and normal mode
set ttimeout 
set ttimeoutlen=0

" detect file type 
filetype on
" difference indent according to filetype
filetype indent on
" 语法检测
syntax enable
" 显示行号
set number
" 显示光标当前位置
set ruler
" 高亮显示搜索结果
set hlsearch
" 鼠标支持
set mouse=n
" 打开增量搜索模式,随键入及时搜索
set incsearch
" 禁止代码折行
set nowrap
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 括号匹配，跳转并高亮下一个匹配的括号
set showmatch
set matchtime=2
" 不生成临时文件
set noswapfile

" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" quick tab
"设置预览窗口位于下部
set splitbelow
"nnoremap <C-[> :ptag <C-R>=expand("<cword>")<cr><cr>
nnoremap <C-j> :ptag <C-R>=expand("<cword>")<cr><cr>
nnoremap <C-k> :pclose <CR>
nnoremap <C-h> :A <CR>

" 快速保存
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" cscope
nnoremap <F3> :cs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <F7> :cs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <F5> :cs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <F6> :cs find f <C-R>=expand("<cfile>")<cr><cr>

" hide line number
function! HideNumber()
    if(&relativenumber == &number)
        set relativenumber! number!
    elseif(&number)
        set number!
    else
        set relativenumber!
    endif
    set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>

autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.java exec ":call SetTitle()"                                                                                       
"定义函数SetTitle，自动插入文件头
func SetTitle()
        "如果文件类型为.c或者.cpp文件
        if (&filetype == 'c' || &filetype == 'cpp')
                call setline(1, "/*")  
                call setline(2, "\ * File name: ".expand("%"))  
                call setline(3, " */")  
        endif
        "如果文件类型为.sh文件
        if &filetype == 'shell'  
                call setline(1, "\#!/bin/sh")
                call setline(2, "\# Author: yourname")
                call setline(3, "\# Created Time : ".strftime("%c"))
                call setline(4, "\# File Name: ".expand("%"))
                call setline(5, "\# Description:")
                call setline(6,"")
        endif
        "如果文件类型为.py文件
        if &filetype == 'python'
                call setline(1, "\#!/usr/bin/env python")
                call setline(2, "\# -*- coding=utf8 -*-")
                call setline(3, "\"\"\"")
                call setline(4, "\# Author: yourname")
                call setline(5, "\# Created Time : ".strftime("%c"))
                call setline(6, "\# File Name: ".expand("%"))
                call setline(7, "\# Description:")
                call setline(8, "\"\"\"")
                call setline(9,"")
        endif
        "如果文件类型为.java文件
        if &filetype == 'java'  
                call setline(1, "//coding=utf8")  
                call setline(2, "/**")  
                call setline(3, "\ *\ @Author: yourname")  
                call setline(4, "\ *\ @Created Time : ".strftime("%c"))  
                call setline(5, "\ *\ @File Name: ".expand("%"))  
                call setline(6, "\ *\ @Description:")  
                call setline(7, "\ */")  
                call setline(8,"")  
        endif
endfunc
" 自动将光标移动到文件末尾
autocmd BufNewfile * normal G


" nerdcomment
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"Doxygen
nnoremap <Leader>d :Dox <CR>
let g:DoxygenToolkit_paramTag_pre="@param "

" EasyAlign
vmap <Leader>l <Plug>(EasyAlign)
nmap <Leader>l <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" tab
nnoremap <Leader>e :tabnew<CR>
nnoremap <Leader>t :tabn<CR>

" LeaderF configuration
noremap <C-p>f :LeaderfFunction!<cr>
noremap <C-p>t :LeaderfBufTag<cr>
noremap <C-p>l :LeaderfFile<cr>

let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
