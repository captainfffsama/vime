" 先导键设置为空格键
let mapleader = "\<space>"
" 窗口相关快捷键
"noremap <c-h> <C-w>h
"noremap <c-j> <C-w>j
"noremap <c-k> <C-w>k
"noremap <c-l> <C-w>l
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
" 更改窗口垂直大小
nnoremap <M--> :resize +3<CR>
nnoremap <M-_> :resize -3<CR>
" 更改窗口水平大小
nnoremap <M-(> :vertical resize -3<CR>
nnoremap <M-)> :vertical resize +3<CR>
" 分割窗口
"nnoremap <c-w>k :abo split <cr>
"nnoremap <c-w>h :abo vsplit <cr>
"nnoremap <c-w>j :rightbelow split <cr>
"nnoremap <c-w>l :rightbelow vsplit <cr>
nnoremap <M-w>- <c-w>-
nnoremap <M-w>_ <c-w>_
nnoremap <c-w>- :rightbelow vsplit <cr>
nnoremap <c-w>_ :rightbelow split <cr>
" 关闭窗口
nnoremap <silent> q <esc>:close<cr>
vnoremap <silent> q <esc>:close<cr>

" 关闭搜索颜色
nnoremap <BackSpace> :nohl<cr>

" 使用leader q执行宏录制功能
nnoremap <leader>q q
" jk表示esc
"inoremap jk <esc>

augroup vime_keymap_group
    autocmd!
    " 使用esc退出终端
    if has('nvim')
            au TermOpen term://* tnoremap <buffer> <Esc> <c-\><c-n> | startinsert
            au BufEnter term://* startinsert
    else
        au TerminalOpen term://* tnoremap <buffer> <Esc> <C-\><C-n> | startinsert
        " au BufEnter term://* startinsert
    endif
augroup END

" 新建终端
nnoremap <leader>tt :terminal<cr>

" 插入模式下的一些快捷键
inoremap <M-o> <esc>o
inoremap <M-O> <esc>O
inoremap <M-h> <HOME>
inoremap <M-l> <END>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

function! s:writeCurrent() abort
    if !&readonly && &buftype =~# '^\%(acwrite\)\=$' && expand('%') !=# ''
        silent write
    endif
endfunction
" noremap <silent> <space><space> <esc>:call common#functions#Wall()<cr>
noremap <silent> <space><space> <esc>:call <SID>writeCurrent()<cr>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" 复制到末尾
nnoremap Y y$
nnoremap vv ^vg_

if !common#functions#HasPlug('vim-airline') && !common#functions#HasPlug('vim-crystalline')
    nnoremap  <M-l> :call common#functions#MoveTabOrBuf(1)<cr>
    nnoremap  <M-h> :call common#functions#MoveTabOrBuf(0)<CR>
    tnoremap  <M-l> <c-\><c-n>:call common#functions#MoveTabOrBuf(1)<cr>
    tnoremap  <M-h> <c-\><c-n>:call common#functions#MoveTabOrBuf(0)<CR>
endif
nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <M-L> :tabmove +1<cr>
nnoremap <silent> <M-H> :tabmove -1<cr>
tnoremap <silent> <M-L> <c-\><c-n>:tabmove +1<cr>
tnoremap <silent> <M-H> <c-\><c-n>:tabmove -1<cr>

" 使用系统应用打开当前buffer文件
noremap <silent> <M-x> :call common#functions#OpenFileUsingSystemApp(expand('%:p'))<cr>
