" 设置运行时文件夹
set runtimepath+=~/.vim
" 设置自动加载文件夹
source ~/.vim/autoload/*.vim
" 自动启用彩虹括号
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" scheme 换行后括号不另起一行
let paredit_electric_return=0
" 设置行号
set number
" 设置语法高亮
syntax on
" 设置行首快捷键
nnoremap H ^
" 设置行尾快捷键
nnoremap L $
" 设置跳转匹配括号快捷键
nnoremap t %
" 设置退出快捷键
inoremap jh <Esc>
" 设置对齐
set autoindent
set smartindent
" 在插入模式下切换光标样式
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 设置补全背景颜色
highlight Pmenu    guibg=darkgrey  guifg=black ctermbg=darkgrey ctermfg=black
highlight PmenuSel guibg=lightgrey guifg=black ctermbg=lightgrey ctermfg=black
" 设置 scheme 自动补全
autocmd BufNewFile,BufRead *.ss set filetype=scheme
autocmd FileType scheme set dictionary=~/.vim/dict/scheme.dict
set complete-=k complete+=k
function! InserTabWrapper()
        let col=col('.')-1
        if !col || getline('.')[col-1] !~ '\k'
                return "\<TAB>"
        else
                return "\<C-N>"
        endif
endfunction
inoremap <TAB> <C-R>=InserTabWrapper()<CR>
