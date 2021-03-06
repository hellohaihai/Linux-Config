set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
nmap tt :%s/\t/    /g<CR>
"新文件标题
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash")
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1,"")
        call append(line(".")+2, "#  > File Name: ".expand("%"))
        call append(line(".")+3, "#  > Author:xiehonghui[haihai] ")
        call append(line(".")+4, "#  > Mail: xiehonghui@estor.com.cn/haihai_sxau@163.com")
        call append(line(".")+5, "#  > Created Time: ".strftime("%c"))
    call append(line(".")+6, "") 
    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
    call append(line(".")+1, "") 
    else 
    call setline(1, "/*************************************************************************") 
    call append(line("."), "    > File Name: ".expand("%")) 
    call append(line(".")+1, "  > Author:xiehonghui[haihai] ") 
    call append(line(".")+2, "  > Mail: xiehonghui@estor.com.cn/haihai_sxau@163.com") 
    call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
    call append(line(".")+4, " ************************************************************************/") 
    call append(line(".")+5, "") 
    endif
    if expand("%:e") == 'cpp'
    call append(line(".")+6, "#include<iostream>")
    call append(line(".")+7, "using namespace std;")
    call append(line(".")+8, "") 
    endif
    if &filetype == 'c' 
    call append(line(".")+6, "#include<stdio.h>")
    call append(line(".")+7, "") 
    endif
    if expand("%:e") == 'h' 
    call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
    call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
    call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
    call append(line(".")+6,"public class ".expand("%:r"))
    call append(line(".")+7,"")
    endif
endfunc 
