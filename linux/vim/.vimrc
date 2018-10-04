set nocompatible              " be iMproved, required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tczengming/autoload_cscope.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'Valloric/YoucompleteMe'
" Plugin 'iamcco/markdown-preview.vim'
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'tpope/vim-obsession'
Plugin 'junegunn/vim-easy-align'
Plugin 'zivyangll/git-blame.vim'
Plugin 'vim-scripts/cscope_win'
call vundle#end()            
" required filetype plugin indent on    " required

" 检测文件类型
filetype on 
" 针对不同的文件采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on 
" 启动自动补全
filetype plugin indent on


"let g:solarized_termcolors=16
syntax enable
"colorscheme solarized
colorscheme molokai
set background=dark
"let g:rehash256=1
"syntax enable
"let g:solarized_termtrans = 1
"colorscheme solarized
"set background=dark

set cindent
" 显示行号
set number
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示搜索结果
set hlsearch
" 鼠标支持
set mouse=n
set ttymouse=xterm2
" 在上下移动光标时,光标的上方或下方至少会保留的行数
set scrolloff=5
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

set autoindent

" vim8.1 new
set noshowmatch
 

" 括号匹配，跳转并高亮下一个匹配的括号
set showmatch
set matchtime=2

" 不生成临时文件
set noswapfile

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly 

" 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"设置预览窗口位于下部
set splitbelow
"nnoremap <C-[> :ptag <C-R>=expand("<cword>")<cr><cr>
nnoremap <C-j> :ptag <C-R>=expand("<cword>")<cr><cr>
nnoremap <C-k> :pclose <CR>
nnoremap <C-h> :A <CR>

" quick copy & paste
map <C-y> "+y
map <C-p> "+p


" 快速保存
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

set tags=tags
set autochdir

"if has("cscope")  
    "set csprg=/usr/local/bin/cscope  
    "set csto=0 
    "set cst  
    "set csverb  
    "set cspc=3 
    ""add any database in current dir  
    "if filereadable("cscope.out")  
        "cs add cscope.out  
    ""else search cscope.out elsewhere  
    "else 
        "let cscope_file=findfile("cscope.out",".;")  
        "let cscope_pre=matchstr(cscope_file,".*/")  
        "if !empty(cscope_file) && filereadable(cscope_file)  
            "exe "cs add" cscope_file cscope_pre  
        "endif        
    "endif  
"endif
nnoremap <F3> :cs find g <C-R>=expand("<cword>")<cr><cr>
nnoremap <F7> :cs find t <C-R>=expand("<cword>")<cr><cr>
nnoremap <F5> :cs find c <C-R>=expand("<cword>")<cr><cr>
nnoremap <F6> :cs find f <C-R>=expand("<cfile>")<cr><cr>


set backspace=indent,eol,start


            

"设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=1 
" 设置显示／隐藏标签列表子窗口的快捷键。速记：tag list 
nnoremap <F8> :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }



" Plugin YCM settings.
set completeopt=longest,menu
set encoding=utf-8
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0


let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
" path to the chrome or the command to open chrome(or other modern browsers)

let g:mkdp_auto_start = 0
" set to 1, the vim will open the preview window once enter the markdown
" buffer

let g:mkdp_auto_open = 0
" set to 1, the vim will auto open preview window when you edit the
" markdown file

let g:mkdp_auto_close = 1
" set to 1, the vim will auto close current preview window when change
" from markdown buffer to another buffer

let g:mkdp_refresh_slow = 0
" set to 1, the vim will just refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor

let g:mkdp_command_for_global = 0
" set to 1, the MarkdownPreview command can be use for all files,
" by default it just can be use in markdown file


vmap bl :<C-U>!svn blame <C-R>=expand("%p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>


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


" python file auto insert comment
function HeaderPython()
    call setline(1, "# -*- coding: utf-8 -*-")
    call append(1, "# Pw @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


" CtrlP file search configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


map <C-n> :NERDTreeToggle<CR>


" python pep8
"au BufNewFile,BufRead *.py
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set textwidth=79
"set expandtab
"set autoindent
"set fileformat=unix


" Ack
"cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
let g:ack_autoclose = 1
let g:ack_qhandler = "topleft copen"
"let g:ackhighlight = 1


"Doxygen
nnoremap <Leader>d :Dox <CR>
let g:DoxygenToolkit_paramTag_pre="@param "


" nerdcommenter
let NERDSpaceDelims=1

vmap <Leader>l <Plug>(EasyAlign)
nmap <Leader>l <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

autocmd BufNewFile *.c,*.cpp,*.sh,*.py,*.java exec ":call SetTitle()"                                                                                       
"定义函数SetTitle，自动插入文件头
func SetTitle()
        "如果文件类型为.c或者.cpp文件
        if (&filetype == 'c' || &filetype == 'cpp')
                call setline(1, "/***************************************************")  
                call setline(2, "\* Module name: ".expand("%"))  
                call setline(3, "\* Copyright 2015 - 2018, Mobike Company as an unpublished work.")  
                call setline(4, "\*")  
                call setline(5, "\* All Rights Reserved.")  
                call setline(6, "\*")  
                call setline(7, "\* The information contained herein is confidential" )  
                call setline(8, "\* property of Mobike Company. The user, copying, transfer or" )  
                call setline(9, "\* disclosure of such information is prohibited except" )  
                call setline(10, "\* by express written agreement with Mobike Company." )  
                call setline(11, "\*" )  
                call setline(12, "\* Module Description:" )  
                call setline(13, "***************************************************/")  
        endif
        "如果文件类型为.sh文件
        if &filetype == 'shell'  
                call setline(1, "\#!/bin/sh")
                call setline(2, "\# Author: 你的名字")
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
                call setline(4, "\# Author: 你的名字")
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
                call setline(3, "\ *\ @Author: 你的名字")  
                call setline(4, "\ *\ @Created Time : ".strftime("%c"))  
                call setline(5, "\ *\ @File Name: ".expand("%"))  
                call setline(6, "\ *\ @Description:")  
                call setline(7, "\ */")  
                call setline(8,"")  
        endif
endfunc
" 自动将光标移动到文件末尾
autocmd BufNewfile * normal G

" Git blame
" nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>)

" tab
nnoremap <Leader>e :tabnew<CR>
nnoremap <Leader>t :tabn<CR>
