let g:spacevim_enable_debug = 0  " 不进入debug状态
let g:spacevim_enable_tabline_filetype_icon = 1  " 上方文件类型的图标
let g:spacevim_buffer_index_type = 1  " 上方图标样式
let g:spacevim_enable_vimfiler_welcome = 0  " 不显示欢迎界面
let g:spacevim_enable_vimfiler_gitstatus = 1  " 显示git状态
let g:spacevim_enable_ycm = 1  " YouCompleteme语法补全插件
let g:spacevim_enable_neomake = 0  " 不使用spacevim的neomake语法检查
let g:spacevim_enable_statusline_display_mode = 1  " 显示模块信息
" 增加语法检查插件, 状态栏插件
let g:spacevim_custom_plugins = [
          \ ['vim-syntastic/syntastic'],
          \ ['vim-airline/vim-airline'],
          \ ]
let g:syntastic_python_checkers = ['pylint'] " 语法检查
let g:syntastic_check_on_wq = 0  " 离开时不检查
let g:airline_powerline_fonts = 1 " 状态栏下方的字体, 这个字体显示没有问题
let g:spacevim_filemanager = 'nerdtree'  " 文件树
call SpaceVim#layers#load('git', 'ui', 'VersionControl') " 加载这些layers
" 禁用以下层
call SpaceVim#layers#disable('checkers')
call SpaceVim#layers#disable('edit')
call SpaceVim#layers#disable('format')
call SpaceVim#layers#disable('sudo')
let g:spacevim_simple_mode = 1
let g:spacevim_windows_leader = ','


" 自定义快捷键
nnoremap H 0_
nnoremap L $
nnoremap - ddkkp
vnoremap - dkkp
nnoremap = ddp
vnoremap = dp
inoremap jh <Esc>
" 文件目录
map <C-e> :NERDTreeToggle<CR>
" tag目录
map <C-l> :TagbarToggle<CR>
" 一键格式化代码
autocmd FileType python noremap <buffer> <F8> :w<CR>:!autopep8 --in-place %<CR>

" 自动加头信息
autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"  
func! SetTitle() 
  if &filetype == 'sh'
    call setline(1, "\# File Name: ".expand("%"))  
    call setline(3, "\# Created Time: ".strftime("%c"))  
    call setline(4, "\#!/bin/bash")  
    call setline(5, "")  
  else  
    call setline(1, "\#!/usr/bin/python3")  
    call setline(2, "\# -*- coding: utf-8 -*-")  
    call setline(3, "\# File Name: ".expand("%"))  
    call setline(4, "\# Created Time: ".strftime("%c"))  
    call setline(5, "")  
  endif  
  normal G
endfunc  

" 一键运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
              exec "!g++ % -o %<"
              exec "!./%<"
  elseif &filetype == 'cpp'
              exec "!g++ % -o %<"
              exec "!./%<"
  elseif &filetype == 'sh'
              :!time bash %
  elseif &filetype == 'python'
              exec "!python3 %"
  endif
endfunc
