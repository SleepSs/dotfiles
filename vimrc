"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  __   __   __     __    __     ______   ______     ______     ______
" /\ \ / /  /\ \   /\ "-./  \   /\  ___\ /\  __ \   /\  ___\   /\__  _\
" \ \ \"/   \ \ \  \ \ \-./\ \  \ \  __\ \ \  __ \  \ \___  \  \/_/\ \/
"  \ \__|    \ \_\  \ \_\ \ \_\  \ \_\    \ \_\ \_\  \/\_____\    \ \_\
"   \/_/      \/_/   \/_/  \/_/   \/_/     \/_/\/_/   \/_____/     \/_/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" chenxuan的个人Vim配置(无插件版本)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set vb t_vb=             " 设置不要响铃
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set textwidth=0          " 设置禁止自动断行
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set relativenumber       " 展示相对行号
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set noshowmode           " 设置不打开底部insert
set hidden               " 设置允许在未保存切换buffer
set matchpairs+=<:>      " 设置%匹配<>
set background=dark      " 设置背景默认黑色
set mouse=v
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set noexpandtab          " 设置禁止空格替换tab,tab党
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2
set sidescroll=10        " 设置向右滚动字符数
set nofoldenable         " 禁用折叠代码
set list lcs=tab:¦\      " 设置默认开启对齐线
set sidescroll=0         " 设置向右滑动距离
set sidescrolloff=4      " 设置右部距离
" set scrolloff=5          " 设置底部距离


" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                             " vim自身命名行模式智能补全
set completeopt=menuone,preview,noselect " 补全时不显示窗口，只显示补全列表
set omnifunc=syntaxcomplete#Complete     " 设置全能补全
set shortmess+=c                         " 设置补全静默
set cpt+=kspell                          " 设置补全单词

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set smartcase           " 搜索智能匹配大小写

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><c-p> :bp<bar>if &bt!=''<bar>bp<bar>endif<cr>
nnoremap <silent><c-n> :bn<bar>if &bt!=''<bar>bn<bar>endif<cr>
nnoremap <silent>H     :bp<bar>if &bt!=''<bar>bp<bar>endif<cr>
nnoremap <silent>L     :bn<bar>if &bt!=''<bar>bn<bar>endif<cr>
nnoremap <silent><leader>d :bd<cr>

" 打开最近关闭的buffer
let g:map_recent_close={}
func! s:GetRecentClose()
	let s:list=[]
	for [key,value] in items(g:map_recent_close)
		let value['filename']=key
		call insert(s:list,value)
	endfor
	let s:func={m1,m2 -> m1['time']>m2['time']?-1:1}
	call sort(s:list,s:func)
	call setqflist(s:list,'r')
	copen
endfunc
nnoremap <silent><nowait><space>q :call <sid>GetRecentClose()<cr>
" reload .vimrc
nnoremap <leader><leader>s :source $MYVIMRC<cr>
nnoremap <leader><leader>S :source <c-r>=expand('%:p')<cr><cr>

" load vim default plugin
runtime macros/matchit.vim

" check version
if !has('patch-8.0.1453')
	echom "WARNING:vim is too old,so it can support some feature!"|finish
endif


" install binrary tools
func! s:Askifaddpath()
	echohl WarningMsg|if input("need to add to binrary path to $PATH?")=="y"|call system("echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc")|endif|echohl NONE
endfunc
command! -nargs=0 Fzfinstalldeb     exec ":!sudo apt install -y fzf"
command! -nargs=0 Fzfinstallweb     exec ":!wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/fzf-0.36.0-linux_amd64.tar.gz;mkdir ~/.local;mkdir ~/.local/bin;tar -zxvf ./fzf-0.36.0-linux_amd64.tar.gz -C ~/.local/bin;rm ./fzf-0.36.0-linux_amd64.tar.gz"|redraw!|call <sid>Askifaddpath()
command! -nargs=0 Ctagsinstalldeb   exec ":!sudo apt install -y ctags"
command! -nargs=0 Ctagsinstallweb   exec ":!mkdir ~/.local;mkdir ~/.local/bin;wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/ctagsv1.0.0/ctags -O ~/.local/bin/ctags;chmod +x ~/.local/bin/ctags"|redraw!|call <sid>Askifaddpath()
command! -nargs=0 Lfinstallweb      exec ":!mkdir ~/.local;mkdir ~/.local/bin;wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/lf -O ~/.local/bin/lf;chmod +x ~/.local/bin/lf"|redraw!|call <sid>Askifaddpath()
command! -nargs=0 Lazygitinstallweb exec ":!mkdir ~/.local;mkdir ~/.local/bin;wget https://gitee.com/mirrorvim/userful-tools-2/releases/download/cmdv1.0.0/lazygit.tar.gz;tar -zxvf ./lazygit.tar.gz -C ~/.local/bin;rm ./lazygit.tar.gz ~/.local/bin/README.md ~/.local/bin/LICENSE"|redraw!|call <sid>Askifaddpath()

" 插入模式下的光标移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
""inoremap <c-h> <left>
" 插入模式
function! Osc52Yank()
    let buffer=system('base64 -w0', @0)
    let buffer=substitute(buffer, "\n$", "", "")
    let buffer='\e]52;c;'.buffer.'\x07'
    silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape("/dev/pts/0")
endfunction
" command! Osc52CopyYank call Osc52Yank()
""augroup Example
""    autocmd!
""    autocmd TextYankPost * if v:event.operator ==# 'y' | call Osc52Yank() | endif
""augroup END


" 插入移动
inoremap <c-e> <end>
inoremap <c-a> <c-o>^
inoremap <c-d> <del>
inoremap <c-f> <c-o>w
inoremap <c-v> <c-o>D
inoremap <expr><c-b> <sid>CtrlB()
func! s:CtrlB()
	if pumvisible()|return "\<c-n>"
	elseif getline('.')[col('.')-2]==nr2char(9)
		let s:pos=col('.')|let s:result=""
		while s:pos!=0|let s:result=s:result."\<bs>"|let s:pos-=1|endwhile
		return s:result
	else
		return "\<c-o>b"
	endif
endfunc


" 定位装置
" locate { and } 
nnoremap <c-y> /{<cr>:noh<cr>va}<c-g>
nnoremap <c-t> ?}<cr>:noh<cr>va{<c-g>
inoremap <c-y> <c-[>/{<cr>:noh<cr>va}<c-g>
vnoremap <c-y> <c-[>/{<cr>:noh<cr>va}<c-g>
vnoremap <c-t> <c-[>?}<cr>:noh<cr>va{<c-g>
inoremap <c-t> <c-[>?}<cr>:noh<cr>va{<c-g>






" term console
func! Tapi_EditFile(bufnum,arglist)
	execute ":wincmd p"
	if isdirectory(a:arglist[0])
		execute ":cd " . a:arglist[0]|echo "cd ".a:arglist[0]." success"
	else
		execute ":edit " . a:arglist[0]|echo "open ".a:arglist[0]." success"
	endif
	if len(a:arglist)>1|call term_sendkeys(a:bufnum,a:arglist[1]."\<cr>")|endif
	if len(gettabinfo())>1|tabclose|if filereadable(a:arglist[0])|execute ":edit " . a:arglist[0]|endif|endif
endfunc
tnoremap <c-\> <c-\><c-n>
tnoremap <c-o> printf '\033]51;["call","Tapi_EditFile",["%s/%s"]]\007' $PWD<space>
tnoremap <c-]> printf '\033]51;["call","Tapi_EditFile",["%s/%s","exit"]]\007' $PWD<space>
tnoremap <c-z> exit<cr>
nnoremap <leader><leader>T :bo term ++rows=6<CR>
nnoremap <leader><leader>t :vert term<CR>
nnoremap <silent><space><space>t :tabe<cr>:execute ":vert term ++curwin ++close " <cr>
nnoremap <silent><space><space>T :let @s=expand('%:p:h')<cr>:tabe<cr>:call term_start("bash",{"cwd":"<c-r>=@s<cr>","curwin":1,"term_finish":"close"})<cr>
if has('nvim')
	nnoremap <leader><leader>T :split<CR>:term<cr>
	nnoremap <leader><leader>t :vsplit<CR>:term<cr>
	nnoremap <silent><space><space>t :term<cr>
endif

" fzf self defile
func! s:FzfFind(command)
	vert call term_start('bash',{'term_finish':"close"})
	call term_sendkeys(term_list()[0],a:command."\<cr>")
endfunc
let g:fzf_temp_file=""
func! Tapi_Fzf(bufnum,arglist)
	wincmd p|let temp=getenv("FZF_VIM")
	if len(a:arglist)>1|call term_sendkeys(a:bufnum,a:arglist[1]."\<cr>")|endif
	if temp!=v:null
		for line in readfile(g:fzf_temp_file)
			let list=matchstr(line,"\/\^.*")
			if a:arglist[0]=="0"|let @/="\\V\\^".line."\\$"|else|let @/="\\V".escape(strpart(list,1,len(list)-2),"^$")|endif
			call feedkeys('n','in')|set hlsearch
		endfor
	endif
endfunc
nnoremap <silent><space>z :call <sid>FzfFind('printf "\033]51;[\"call\",\"Tapi_EditFile\",[\"%s/%s\",\"exit\"]]\007" $PWD `fzf --layout=reverse --preview-window=down --preview "head -64 {}"`')<cr>
nnoremap <silent><space>Z :let fzf_temp_file=tempname()<cr>:call setenv("FZF_VIM",g:fzf_temp_file)<cr>:call <sid>FzfFind('ctags -x --_xformat="%N     %P" -f - <c-r>=expand('%:p')<cr><bar>fzf > $FZF_VIM;printf "\033]51;[\"call\",\"Tapi_Fzf\",[\"$FZF_VIM\",\"exit\"]]\007"')<cr>

" lf config define
nnoremap <silent><space>E :tabe<cr>:vert term ++curwin ++close lf <c-r>=getenv('HOME')<cr><cr>
nnoremap <silent><space>e :tabe<cr>:vert term ++curwin ++close lf .<cr>

" set pair baket
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
cnoremap ( ()<left>
cnoremap [ []<left>
cnoremap { {}<left>
" jump
func! s:Judge(ch,mode)
	if a:mode!='c'
		let ch=getline('.')[col('.')-1]
	else
		let ch=getcmdline()[getcmdpos()-1]
	endif
	if a:ch=='"'||a:ch=="'"||a:ch=='`'
		if ch!=a:ch
			return a:ch.a:ch."\<left>"
		endif
	endif
	if ch==a:ch
		return "\<right>"
	endif
	return a:ch
endfunc
inoremap <expr><silent>" <sid>Judge('"','i')
inoremap <expr><silent>` <sid>Judge('`','i')
inoremap <expr><silent>' <sid>Judge("'",'i')
inoremap <expr><silent>> <sid>Judge('>','i')
inoremap <expr><silent>) <sid>Judge(')','i')
inoremap <expr><silent>} <sid>Judge('}','i')
inoremap <expr><silent>] <sid>Judge(']','i')
cnoremap <expr>" <sid>Judge('"','c')
cnoremap <expr>` <sid>Judge('`','c')
cnoremap <expr>' <sid>Judge("'",'c')
cnoremap <expr>> <sid>Judge('>','c')
cnoremap <expr>) <sid>Judge(')','c')
cnoremap <expr>} <sid>Judge('}','c')
cnoremap <expr>] <sid>Judge(']','c')
" set backspace
" yank and paste
nnoremap <leader>p "0p
vnoremap <leader>p "0p
nnoremap <leader>P "0P
vnoremap <leader>P "0P
nnoremap <leader>y "+y
vnoremap <leader>y "0y
nnoremap <leader>Y "0Y
vnoremap <leader>Y "0Y

" vimdiff tool
cab <expr>Diff "Diff ".expand('%:p:h')."/"
command! -nargs=1 -bang -complete=file Diff exec ":vert diffsplit ".<q-args>
command! -nargs=0 Remote :diffg RE
command! -nargs=0 Base   :diffg BA
command! -nargs=0 Local  :diffg LO

" edit binrary
func! s:BinraryEdit(args) abort
	if join(readfile(expand('%:p'), 'b', 5), '\n') !~# '[\x00-\x08\x10-\x1a\x1c-\x1f]\{2,}'
		echo "not a bin file"|return
	endif
	if &readonly|execute ":edit ++bin ".expand('%:p')|endif|setlocal bin
	setlocal bin
	if !executable('xxd')|echoerr "xxd not find,install it first"|return|endif
	echo "transform...please wait..."
	let g:xxd_cmd=":%!xxd ".a:args
	silent! execute g:xxd_cmd|let &modified=0|redraw!
	augroup Binrary
		au!
		autocmd BufWritePre  <buffer> let g:bin_pos_now=getcurpos()|silent! exec ":%!xxd -r"
		autocmd BufWritePost <buffer> silent! exec g:xxd_cmd|call cursor([g:bin_pos_now[1],g:bin_pos_now[2]])
		autocmd BufDelete    <buffer> au! Binrary
	augroup END
endfunc
command! -nargs=? Binrary :call <sid>BinraryEdit(<q-args>)

" change window width
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" change window in normal
nnoremap <c-k> <c-w>k
nnoremap <c-j> <c-w>j
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <s-up>    <c-w>k
nnoremap <s-down>  <c-w>j
nnoremap <s-left>  <c-w>h
nnoremap <s-right> <c-w>l

" change window location
nnoremap <c-s-up> <c-w>K
nnoremap <c-s-down> <c-w>J
nnoremap <c-s-left> <c-w>H
nnoremap <c-s-right> <c-w>L

" quick fix
nnoremap [q :cnext<cr>
nnoremap ]q :cprevious<cr>
nnoremap \q :cclose<cr>
nnoremap =q :copen<cr>
nnoremap ]Q :cnext<cr>:call <sid>Qfpopup()<cr>
nnoremap [Q :cprevious<cr>:call <sid>Qfpopup()<cr>
func! s:Qfpopup()abort
	let dict=getqflist({'all':1})|let pos=dict['idx']|let item=dict['items']|let len=len(dict['items'])
	if len==0||(pos==1&&item[pos-1]['lnum']==0)|cclose|return|endif|let show=[item[pos-1]['text']]
	while pos<len&&item[pos]['lnum']==0|let show=add(show,item[pos]['text'])|let pos+=1|endwhile
	let show=show[0:-2]|call popup_atcursor(show,{})
endfunc

" set mouse

" show indent line
nnoremap <silent><nowait>=i :set list lcs=tab:¦\<space> <cr>
nnoremap <silent><nowait>\i :set nolist<cr>

" set spell
nnoremap <silent><nowait>=s :setlocal spell<cr>
nnoremap <silent><nowait>\s :setlocal nospell<cr>
" z= is list of change

" set wrap
nnoremap <silent><nowait>=r :setlocal wrap<cr>:noremap<buffer> j gj<cr>:noremap<buffer> k gk<cr>
nnoremap <silent><nowait>\r :setlocal nowrap<cr>:unmap<buffer> j<cr>:unmap<buffer> k<cr>

" set line number
nnoremap <silent><nowait>=n :setlocal norelativenumber<cr>
nnoremap <silent><nowait>\n :setlocal relativenumber<bar>setlocal number<cr>

" close/open number
nnoremap <silent><nowait>=N :setlocal norelativenumber<cr>:setlocal nonumber<cr>:set nolist<cr>
nnoremap <silent><nowait>\N :setlocal relativenumber<cr>:setlocal number<cr>:set list lcs=tab:¦\<space> <cr>

" set fold auto
nnoremap <silent><nowait>=z :setlocal fdm=indent<cr>:setlocal fen<cr>
nnoremap <silent><nowait>\z :setlocal fdm=manual<cr>:setlocal nofen<cr>
nnoremap <silent><nowait>=o zO
nnoremap <silent><nowait>\o zC
nnoremap <silent><nowait><expr><bs> foldlevel('.')>0?"zc":"\<bs>"

" tab ctrl
nnoremap <silent><nowait>=t :tabnew<cr>
nnoremap <silent><nowait>\t :tabc<cr>
nnoremap <silent><nowait>[t :tabp<cr>
nnoremap <silent><nowait>]t :tabn<cr>

" set search noh
""nnoremap <silent><nowait>\h :noh<cr>
""nnoremap <silent><nowait>=h :set hlsearch<cr>

" set auto indent file
nnoremap <silent>=<tab> :call <sid>IndentSet()<cr>
func! s:IndentSet()abort
	let line=matchstr(getline(line('.')),"^\\s*")
	for temp in getline(line('.')+1, line('$'))
		let temp=matchstr(temp,"^\\s*")|if temp!=line|break|endif
	endfor
	if (len(line)!=0&&line[0]==' ')||(len(temp)!=0&&temp[0]==' ')
		setlocal expandtab|exec "setlocal shiftwidth=".abs(len(line)-len(temp))
	endif
	echo 'indent ok'
endfunc

" delete <space> in end of line
nnoremap <silent><nowait>d<space> :%s/ *$//g<cr>:noh<cr><c-o>
nnoremap <nowait>g<space> :syntax match DiffDelete " *$"<cr>

" delete empty line
""nnoremap <silent><nowait>dl :g/^\s*$/d<cr>

" select search
xmap g/ "sy/\V<c-r>=@s<cr>

" run macro in visual model
""xnoremap @ :normal @

" repeat for macro

" use select area to replace
xnoremap s  :<c-u>execute "normal! gv\"sy"<cr>:%s/\V<c-r>=@s<cr>/<c-r>=@s<cr>/gn<left><left><left>
nnoremap gs :%s/<c-r>=@/<cr>//gn<left><left><left>
xnoremap gs :<c-u>execute "normal! gv\"sy"<cr>:call <sid>ReplaceGlobal(@s)<cr>
func s:ReplaceGlobal(str) abort
	let str=escape(a:str,'/')|let temp=escape(input("replace ".a:str." to:"),'/')
	call system('sed -i "s/'.str.'/'.temp.'/g" `grep "'.escape(a:str,'"').'" -rl --exclude-dir=".git" ./`')|redraw!|echo "replace ok"
endfunc

" indent buffer
nnoremap <silent><nowait> =e gg=G<c-o><c-o>zz
onoremap <silent>ae :<c-u>normal! ggVG<cr>
xnoremap <silent>ae :<c-u>normal! ggVG<cr>

" object line
onoremap <silent>il :<c-u>normal! ^v$BE<cr>
xnoremap <silent>il :<c-u>normal! ^v$<cr><left>
onoremap <silent>al :<c-u>normal! 0v$<cr>
xnoremap <silent>al :<c-u>normal! 0v$<cr>

" object argc
onoremap <silent>aa :<c-u>call <sid>GetArgs('a')<cr>
onoremap <silent>ia :<c-u>call <sid>GetArgs('i')<cr>
xnoremap <silent>aa :<c-u>call <sid>GetArgs('a')<cr>
xnoremap <silent>ia :<c-u>call <sid>GetArgs('i')<cr>
func! s:GetArgs(model)
	let model=a:model
	let line=line('.')|let col=col('.')|let i=col-1|let now=getline('.')
	let begin=-1|let end=-1|let pos0=-1|let pos1=-1
	let buket=0|let flag=0
	while i>0
		let temp=now[i]|let flag=0
		if temp==')'|let buket+=1|endif
		if temp=='('|let buket-=1|let flag=1|endif
		if (buket>0)||(buket==0&&flag)|let i-=1|continue|endif
		if temp=='('|| temp==','|let begin=temp|let pos0=i|break|endif
		let i-=1
	endwhile
	let i=col|let buket=0|let flag=0
	while i<col('$')
		let temp=now[i]|let flag=0
		if temp=='('|let buket+=1|endif
		if temp==')'|let buket-=1|let flag=1|endif
		if (buket>0)||(buket==0&&flag)|let i+=1|continue|endif
		if temp==')'|| temp==','|let end=temp|let pos1=i|break|endif
		let i+=1
	endwhile
	if model=='i'
		let pos0+=1|let pos1-=1
	else
		if begin=='('|let pos0+=1|else|let pos1-=1|endif
	endif
	call cursor([line,pos0+1])
	let pos1-=pos0|echom end
	execute "normal! v".pos1."l"
endfunc

" easy to get obj
""onoremap <silent>i, i<
""onoremap <silent>a, a<
""xnoremap <silent>i, i<
""xnoremap <silent>a, a<
""onoremap <silent>i; i"
""onoremap <silent>a; a"
""xnoremap <silent>i; i"
""xnoremap <silent>a; a"
""onoremap <silent>in i{
""onoremap <silent>an a{
""xnoremap <silent>in i{
""xnoremap <silent>an a{

" sudo to write file
cab w!! w !sudo tee % >/dev/null

" quick to change dir
cab cdn cd <c-r>=expand('%:p:h')<cr>
cab cdr cd <c-r>=<sid>FindRoot()<cr>
func! s:FindRoot()
	let s:gitdir = finddir(".git", getcwd() .';')
	if !empty(s:gitdir)
		if s:gitdir==".git"|let s:gitdir=getcwd()
		else|let s:gitdir=strpart(s:gitdir,0,strridx(s:gitdir,"/"))
		endif
		return s:gitdir
	endif
	return ""
endfunc



" set tab indent
xnoremap <tab>   >gv
xnoremap <s-tab> <gv

" set tab next snippet
smap <tab>   <c-j>
smap <s-tab> <c-k>

" enhance gf
nnoremap gf gF
vnoremap gf gF

" set split window
nnoremap <silent><nowait>_ :vsp<cr>:bn<cr>
nnoremap <silent><nowait>+ :sp<cr>:bn<cr>

" edit file
nnoremap e         :edit<space><c-r>=getcwd()<cr>/
nnoremap E         :edit<space><c-r>=expand('%:p:h')<cr>/

" open : quick
nnoremap <space>; :
xnoremap <space>; :


" add empty line
nnoremap <silent><nowait>U :call append(line('.')-1,"")<cr>
nnoremap <silent><nowait>M :call append(line('.'),"")<cr>

" make move easy
nnoremap <silent><c-e> $
vnoremap <silent><c-e> $
nnoremap <silent><expr><c-a> getline('.')[col('.')-1]>='0'&&getline('.')[col('.')-1]<='9'?"\<c-a>":"^"
vnoremap <silent><expr><c-a> mode()==#'v'&&line('.')==line('v')?"^":"\<c-a>"

" enhance c-a and c-x
nnoremap <silent><expr>g<c-a> getline('.')[col('.')-1]=='9'?"r0":"r".(getline('.')[col('.')-1]+1)
nnoremap <silent><expr>g<c-x> getline('.')[col('.')-1]=='0'?"r9":"r".(getline('.')[col('.')-1]-1)

" add space
func! s:AddSpace()
	execute("normal! i ")|redraw|let ch=nr2char(getchar())
	while ch==' '|execute("normal! i ")|redraw|let ch=nr2char(getchar())|endwhile
	call feedkeys(ch,'in')
endfunc
nnoremap <silent><leader><space> :call <sid>AddSpace()<cr>
     
" scroll in other window
nnoremap <silent>\u <c-w>p<c-u><c-w>p
nnoremap <silent>\d <c-w>p<c-d><c-w>p

" redraw the screen
nnoremap <silent>R :redr!<cr>

" ctrl file system
command! -nargs=0 -bang Pwd echo expand('%:p')
command! -nargs=? -bang Reload exec ":edit ".<q-args>." ".expand('%')
nnoremap <silent>S :edit<space><c-r>=expand('%')<cr><cr>
command! -nargs=0 -bang Delete if filereadable(expand('%'))|call delete(expand('%'))|execute ":bd"|execute ":bn"|endif
command! -nargs=1 -bang -complete=file Rename let @s=expand('%')|f <args>|w<bang>|call delete(@s)
cab <expr>Rename "Rename ".expand('%:p:h')."/"
command! -nargs=1 -bang -complete=file Mkdir echo mkdir(<f-args>)
cab <expr>Mkdir "Mkdir ".expand('%:p:h')."/"
command! -nargs=1 -bang -complete=file Rmdir echo delete(<f-args>,"d")
cab <expr>Rmdir "Rmdir ".expand('%:p:h')."/"
command! -nargs=0 -bang Write call mkdir(expand("%:p:h"),"p")|write!
" use cd to change dir

" autoload file

" select move
xnoremap <silent><up>    :move '<-2<cr>gv
xnoremap <silent><down>  :move '>+1<cr>gv
xnoremap <silent><right> y<c-w>lo<c-[>Vpgv
xnoremap <silent><left>  y<c-w>ho<c-[>Vpgv
xnoremap <silent><c-j>   :move '>+1<cr>gv
xnoremap <silent><c-k>   :move '<-2<cr>gv
xnoremap <silent><c-l>   y<c-w>lo<c-[>Vpgv
xnoremap <silent><c-h>   y<c-w>ho<c-[>Vpgv

" open link,is default in vim by gx
func! s:GotoLink()
	let s:list=matchstrpos(getline('.'),'https*://\S[^][(){}]*',0)
	let s:link=s:list[0]
	while s:list[0]!=''&&(s:list[1]>col('.')||s:list[2]<col('.'))
		let s:list=matchstrpos(getline('.'),'https*://\S[^][(){}]*',s:list[2])
	endwhile
	if s:list[0]!=''|let s:link=s:list[0]|endif
	let s:browser=get(g:,'default_browser','firefox')
	if s:link!=''
		call job_start(s:browser.' '.s:link)
	else
		echo 'cannot find link'
	endif
endfunc
nnoremap <silent><nowait>gl :call <sid>GotoLink()<cr>



" session manager
nnoremap <space>S :mksession! .session.vim<cr>
nnoremap <space>s :silent! source .session.vim<cr>

" config complete {{{
inoremap <silent><expr>/ complete_info(["selected"])["selected"]!=-1&&getline(line('.'))[col('.')-2]=='/'?
			\ "\<bs>/\<c-x>\<c-f>":
			\ "/\<c-x>\<c-f>"
let g:cmpX=-1|let g:cmpY=-1
function! s:feed_popup()
	if getline('.')[col('.')-1]=='/'|return|endif
	let x = col('.') - 1|let y = line('.') - 1
	if g:cmpX==x&&g:cmpY==y|return|endif
	let s:min_complete=2
	let s:context=strpart(getline('.'), 0, col('.') - 1)
	let s:match= matchlist(s:context, '\(\k\{' . s:min_complete . ',}\)$')
	if empty(s:match)|return|endif
	silent! call feedkeys("\<c-n>", 'n')
	let g:cmpX=x|let g:cmpY=y
	return
endfunction
augroup Complete
	au!
	au CursorMovedI * nested call s:feed_popup()
	au FileType text setlocal spell|setlocal nospell
augroup END
inoremap <silent><expr><TAB>
			\ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"}}}

" set statusline {{{
function GetMode()
	let m = mode()|let s:str=''|let s:color='#9ECE6A'
	if m == 'R'|let s:color='#F7768E'|let s:str= 'Replace'
	elseif m == 'v'|let s:color='#F7768E'|let s:str= 'Visual'
	elseif m == 'i'|let s:color='#7AA2F7'|let s:str= 'Insert'
	elseif m == 't'|let s:color='#7AA2F7'|let s:str= 'Terminal'
	else|let s:color='#9ECE6A'|let s:str= 'Normal'
	endif
	exec 'highlight User3 font=#000000 guifg=#1a1b26 guibg='.s:color
	exec 'highlight User4 font=#000000 guifg='.s:color.' guibg=#232433'
	redraw|return s:str
endfunction

let g:status_git_branch=""
if has('nvim')
	let g:status_git_branch=' nvim'.' |'
endif
func! GitBranchShow(chan,msg)
	let g:status_git_branch=" ".a:msg." |"
endfunc
if g:status_git_branch==""
	call job_start("git rev-parse --abbrev-ref HEAD",{"out_cb":"GitBranchShow"})
endif

set statusline=%3*\ %{GetMode()}
set statusline+=%4*\ %{g:status_git_branch}\ %F\ \|%m%r%h%w%=
set statusline+=%3*\ %Y\ |
set statusline+=%3*¦%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}¦
set statusline+=%5*☰\ %l/%-L¦%3p%%¦:%v\ ¦
"}}}

" highlight define,you can change self {{{
highlight User1 font=#000000 guifg=#1a1b26 guibg=#9ECE6A
highlight User2 font=#000000 guifg=#9ECE6A guibg=#232433
highlight User3 font=#000000 guifg=#1a1b26 guibg=#9ECE6A
highlight User4 font=#000000 guifg=#9ECE6A guibg=#232433
highlight User5 font=#000000 guifg=#1a1b26 guibg=#7AA2F7
highlight User6 font=#000000 guifg=#7AA2F7 guibg=#232433
"}}}

" set netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
set fillchars=vert:\⎜
nnoremap <leader>n :Lexplore<cr> " set netrw
highlight VertSplit guibg=#1a1b26 guifg=#232433
"}}}

" slash {{{
func! s:SlashCb()
	if g:slash_able
		set nohlsearch|autocmd! slash
	else
		set hlsearch|let g:slash_able=1
	endif
endf
func! s:Slash(oper)
	augroup slash
		autocmd!
		autocmd CursorMoved,CursorMovedI * call <sid>SlashCb()
	augroup END
	let g:slash_able=0
	return a:oper."zz"
endf
nnoremap <silent><expr>n <sid>Slash('n')
nnoremap <silent><expr>N <sid>Slash('N')
xnoremap <silent>* "sy:let @/="\\V".@s<cr>:set hlsearch<cr>
xnoremap <silent># "sy:let @/="\\V".@s<cr>:let v:searchforward=0<cr>:set hlsearch<cr>
nnoremap <silent>* :let @/="\\<".expand('<cword>')."\\>"<cr>:set hlsearch<cr>
nnoremap <silent># :let @/="\\<".expand('<cword>')."\\>"<cr>:let v:searchforward=0<cr>:set hlsearch<cr>
xnoremap <silent>g8 "sy:let @/="\\V".@s<cr>:set hlsearch<cr>
nnoremap <silent>g8 :let @/="\\<".expand('<cword>')."\\>"<cr>:set hlsearch<cr>
"}}}

" set tabline {{{
let s:tab_after=""
func! TabLine(direct)
	let s:tab_result=""|let flag=0
	if a:direct|return s:tab_after!=""?s:tab_after."|":""|else|let s:tab_after=""|endif
	for buf in getbufinfo({'buflisted':1})
		let s:name=buf.name
		if strridx(buf.name,"/")!=-1|let s:name=strpart(buf.name,strridx(buf.name,"/")+1)|endif
		if buf.name!=expand('%:p')
			if flag==0|let s:tab_result=s:tab_result."\ ".s:name|else|let s:tab_after=s:tab_after."\ ".s:name|endif
		else
			let flag=1
		endif
	endfor
	redrawt
	return s:tab_result
endfunc
func! TabLineSet()
	if len(gettabinfo())>1|return "%5*  Tab%2*%=%1* buffer"|endif
	if &modified|let tab="%2* %0.32(%{TabLine(0)}%)%5*\ %t%6*%2*%<%{TabLine(1)}%r%h%w%=%6*\ %5* buffer"
	else|let tab="%2* %0.32(%{TabLine(0)}%)%1*\ %t%2*%2*%<%{TabLine(1)}%r%h%w%=%2*\ %1* buffer"
	endif
	return tab
endfunc
set tabline=%!TabLineSet()
set showtabline=2
"}}}

" set gcc enable {{{
func! s:Commentary(line) abort
	let s:num=a:line
	let line=getline(s:num)
	let uncomment=2
	let [l, r] = split( substitute(substitute(substitute(
				\ &commentstring, '^$', '%s', ''), '\S\zs%s',' %s', '') ,'%s\ze\S', '%s ', ''), '%s', 1)
	let line = matchstr(getline(s:num),'\S.*\s\@<!')
	if l[-1:] ==# ' ' && stridx(line,l) == -1 && stridx(line,l[0:-2]) == 0|let l = l[:-2]|endif
	if r[0] ==# ' ' && line[-strlen(r):] != r && line[1-strlen(r):] == r[1:]|let r = r[1:]|endif
	if len(line) && (stridx(line,l) || line[strlen(line)-strlen(r) : -1] != r)|let uncomment = 0|endif
	let line=getline(s:num)
	let [l, r] = split( substitute(substitute(substitute(
				\ &commentstring, '^$', '%s', ''), '\S\zs%s',' %s', '') ,'%s\ze\S', '%s ', ''), '%s', 1)
	if strlen(r) > 2 && l.r !~# '\\'
		let line = substitute(line,
					\'\M' . substitute(l, '\ze\S\s*$', '\\zs\\d\\*\\ze', '') . '\|' . substitute(r, '\S\zs', '\\zs\\d\\*\\ze', ''),
					\'\=substitute(submatch(0)+1-uncomment,"^0$\\|^-\\d*$","","")','g')
	endif
	if uncomment
		let line = substitute(line,'\S.*\s\@<!','\=submatch(0)[strlen(l):-strlen(r)-1]','')
	else
		let line = substitute(line,'^\%('.matchstr(getline(s:num),'^\s*').'\|\s*\)\zs.*\S\@<=','\=l.submatch(0).r','')
	endif
	call setline(s:num,line)
endfunc
" visual gcc
func! s:VisualComment() abort
	for temp in range(min([line('.'),line('v')]),max([line('.'),line('v')]))
		call s:Commentary(temp)
	endfor
endfunc
nnoremap <silent><nowait>gcc :call <sid>Commentary(line('.'))<cr>
xnoremap <silent><nowait>gc  :call <sid>VisualComment()<cr>
"}}}

" vim sourround {{{
let g:pair_map={'(':')','[':']','{':'}','"':'"',"'":"'",'<':'>','`':'`',}
func! s:AddSourround()
	let s:ch=nr2char(getchar())|let s:col=col('.')|let pos=getcurpos()
	norm! gv"sy
	let s:str = @s
	for k in keys(g:pair_map)
		if s:ch==k||s:ch==g:pair_map[k]
			execute ":s/^\\(.\\{".(col('.')-1)."\\}\\)".escape(s:str, '~"\.^$[]*')."/\\1".k.s:str.g:pair_map[k]."/"
			call setpos('.', pos)
			return
		endif
	endfor
	echo s:ch.' unknow pair'
endfunc
func! s:DelSourround()
	let s:ch=nr2char(getchar())
	if getline('.')[col('.')-1]!=s:ch|echo 'not begin with'.s:ch|return|endif
	for k in keys(g:pair_map)
		if s:ch==k|execute 'normal! xf'.g:pair_map[k].'x'|return|endif
	endfor
endfunc
func! s:ChangeSourround()
	let s:ch=nr2char(getchar())|let s:two=nr2char(getchar())
	let pos=getcurpos()
	if getline('.')[col('.')-1]!=s:ch|echo 'not begin with'.s:ch|return|endif
	execute 'normal! r'.s:two.'f'.g:pair_map[s:ch].'r'.g:pair_map[s:two]
	call setpos('.',pos)
endfunc
xnoremap <silent>S  :<c-u>call <sid>AddSourround()<cr>
nnoremap <silent>ds :call <sid>DelSourround()<cr>
nnoremap <silent>cs :call <sid>ChangeSourround()<cr>
"}}}

" git config {{{
command! -nargs=+ Git echo system("git ".<q-args>)
nnoremap <leader>g :!git log --all --decorate --oneline --graph<cr>

" make run
command! -nargs=+ Run let command=strpart(<q-args>,0,stridx(<q-args>,' '))|
			\exec "set makeprg=".command|
			\exec ":make ".strpart(<q-args>,stridx(<q-args>,' '))|
			\call <sid>Qfpopup()
nnoremap <space>: :Run<space>
cab pyj python3 -m json.tool
"}}}

" ctags config{1gg}}

" like leaderf {{{
set wildignore+=*/bin/*,.git*,*.out,*.gz
func! s:ExludeIgnore()
	let s:ignore_loaded=get(s:,"ignore_loaded",0)
	if !s:ignore_loaded|let file=findfile(".gitignore",".;")|if file!=""|for line in readfile(file)|if line!=""&&match(line,"^#")==-1|exec ":set wildignore+=".line|endif|endfor|endif|endif
endfunc
nnoremap <silent><nowait><space>b :call setqflist(getbufinfo({'buflisted':1}),'r')<cr>:copen<cr>
nnoremap <silent><space>f :call <sid>FzfFind('printf "\033]51;[\"call\",\"Tapi_EditFile\",[\"%s/%s\",\"exit\"]]\007" $PWD `fzf --layout=reverse --preview-window=down --preview "head -64 {}"`')<cr>
nnoremap <nowait><space>h :help<space>
xnoremap <silent><space>h "sy:<c-u>help <c-r>=@s<cr><cr>
nnoremap <nowait><space>a :call <sid>ExludeIgnore()<cr>:vimgrep /\V/j<space>./**<s-left><left><left><left>
xnoremap <nowait><space>a "sy:call <sid>ExludeIgnore()<cr>:vimgrep /\V<c-r>=@s<cr>/j<space>./**<cr>:copen<cr>
nnoremap <silent><space>t :let fzf_temp_file=tempname()<cr>:call setenv("FZF_VIM",g:fzf_temp_file)<cr>:call <sid>FzfFind('ctags -x --_xformat="%N     %P" -f - <c-r>=expand('%:p')<cr><bar>fzf --layout=reverse > $FZF_VIM;printf "\033]51;[\"call\",\"Tapi_Fzf\",[\"$FZF_VIM\",\"exit\"]]\007"')<cr>
nnoremap <silent><space>j :let fzf_temp_file=tempname()<cr>:call setenv("FZF_VIM",g:fzf_temp_file)<cr>:call <sid>FzfFind('ctags -x --_xformat="%N     %P" -f - <c-r>=expand('%:p')<cr><bar>fzf --layout=reverse > $FZF_VIM;printf "\033]51;[\"call\",\"Tapi_Fzf\",[\"$FZF_VIM\",\"exit\"]]\007"')<cr>
nnoremap <silent><space>/ :let fzf_temp_file=tempname()<cr>:call setenv("FZF_VIM",g:fzf_temp_file)<cr>:call <sid>FzfFind('cat <c-r>=expand('%:p')<cr><bar>fzf --layout=reverse > $FZF_VIM;printf "\033]51;[\"call\",\"Tapi_Fzf\",[\"0\",\"exit\"]]\007"')<cr>
nnoremap <silent><space>b :call setqflist(getbufinfo({'buflisted':1}),'r')<cr>:copen<cr>
nnoremap <silent><space>k :call setqflist(getjumplist()[0], 'r')<cr>:copen<cr>
nnoremap <silent><space>l :copen<cr>
" }}}

" like easy motion {{{
let s:easymotion_key=['j','l','k','h','a','s','d','f','g','q','w','e','r','u','i','o','p','c','v','b','n','m','t','y','z','x']
let s:easymotion_leader=[';',',',' ',"'",'.','/','[','\',']']|let s:easymotion_leader_dict={';':0,',':0,'.':0,"'":0,' ':0,'/':0,'[':0,'\':0,']':0}
func! s:EasyMotion()abort
	echo "input key:"|let ch=nr2char(getchar())|let s:easymotion={}|let llen=len(s:easymotion_leader)+1
	let ch=tolower(ch)|if ch>='a'&&ch<='z'|let up=toupper(ch)|else|let up=""|endif
	let info=winsaveview()|let info["endline"]=winheight(0)+info["topline"]|let width=winwidth(0)|let num=0|let old=ch|let pos=0|let klen=len(s:easymotion_key)
	if ch=="\<c-[>"|return|endif|if &fen|setlocal nofen|endif
	let lines=getbufline("%",info["topline"],info["endline"])|let bak=copy(lines)|set nohlsearch
	let hlcomment=[]|let begin=info["topline"]|let end=info["endline"]
	while end-begin>=8|call add(hlcomment,matchaddpos("comment",range(begin,end)))|let begin+=8|endwhile
	call add(hlcomment,matchaddpos("comment",range(begin,end)))
	let listl=range(0,len(lines)-1)|let nowline=info["lnum"]-info["topline"]|call sort(listl,{arg1,arg2 -> abs(arg2-nowline)-abs(arg1-nowline)})
	for i in listl
		" if i+info["topline"]==info["lnum"]|continue|endif
		while 1
			let pos=stridx(lines[i],ch,pos)
			if up!=""|let postemp=stridx(lines[i],up,pos)|if postemp!=-1&&(postemp<pos||pos==-1)|let pos=postemp|endif|endif
			if pos!=-1&&(pos<width||&wrap)
				if num<klen|let req=s:easymotion_key[num]
				elseif num<llen*klen|let req=s:easymotion_leader[num/klen-1].s:easymotion_key[num%klen]
				else|break
				endif
				let m= matchaddpos("incsearch", [[i+info["topline"],pos+1,len(req)]])
				let s:easymotion[req]={"line":i,"pos":pos,"hl":m}
				let lines[i]=strpart(lines[i],0,pos).req.strpart(lines[i],pos+len(req))
				let num+=1|let pos+=2|if num>=llen*klen|break|endif
			else|let pos=0|break
			endif
		endwhile
		if num>=llen*klen|break|endif
	endfor
	if len(s:easymotion)==0|echo "cannot find"|endif
	silent! undojoin|call setline(info["topline"],lines)|redraw!|echo "target key:"| let ch=nr2char(getchar())
	if has_key(s:easymotion_leader_dict,ch)|let ch=ch.nr2char(getchar())|endif
	if has_key(s:easymotion, ch)|let temp=s:easymotion[ch]|call cursor(temp["line"]+info["topline"],temp["pos"]+1)|endif
	for [key,val] in items(s:easymotion)|let i=val["line"]|let pos=val["pos"]|let hl=val["hl"]|call matchdelete(hl)|endfor
	for hlnow in hlcomment|call matchdelete(hlnow)|endfor
	silent! undojoin|call setline(info["topline"],bak)|setlocal nomodified
endfunc
nnoremap <silent>s :call <sid>EasyMotion()<cr>
inoremap <silent><c-s> <c-o>:call <sid>EasyMotion()<cr>
" }}}

" tokyonight color inside,donnot change it {{{
set term=xterm-256color
set termguicolors
let g:tokyonight_style = 'night' " available: night, storm
let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:tmux = executable('tmux') && $TMUX !=# ''
let g:colors_name = 'tokyonight'|let s:configuration = {}
let s:configuration.style = get(g:, 'tokyonight_style', 'night')
let s:configuration.transparent_background = get(g:, 'tokyonight_transparent_background', 0)
let s:configuration.menu_selection_background = get(g:, 'tokyonight_menu_selection_background', 'green')
let s:configuration.disable_italic_comment = get(g:, 'tokyonight_disable_italic_comment', 0)
let s:configuration.enable_italic = get(g:, 'tokyonight_enable_italic', 0)
let s:configuration.cursor = get(g:, 'tokyonight_cursor', 'auto')
let s:configuration.current_word = get(g:, 'tokyonight_current_word', get(g:, 'tokyonight_transparent_background', 0) == 0 ? 'grey background' : 'bold')
if s:configuration.style ==# 'night'
	let s:palette = {
				\ 'black':      ['#06080a',   '237',  'DarkGrey'],
				\ 'bg0':        ['#1a1b26',   '235',  'Black'],
				\ 'bg1':        ['#232433',   '236',  'DarkGrey'],
				\ 'bg2':        ['#2a2b3d',   '236',  'DarkGrey'],
				\ 'bg3':        ['#32344a',   '237',  'DarkGrey'],
				\ 'bg4':        ['#3b3d57',   '237',  'Grey'],
				\ 'bg_red':     ['#ff7a93',   '203',  'Red'],
				\ 'diff_red':   ['#803d49',   '52',   'DarkRed'],
				\ 'bg_green':   ['#b9f27c',   '107',  'Green'],
				\ 'diff_green': ['#618041',   '22',   'DarkGreen'],
				\ 'bg_blue':    ['#7da6ff',   '110',  'Blue'],
				\ 'diff_blue':  ['#3e5380',   '17',   'DarkBlue'],
				\ 'fg':         ['#a9b1d6',   '250',  'White'],
				\ 'red':        ['#F7768E',   '203',  'Red'],
				\ 'orange':     ['#FF9E64',   '215',  'Orange'],
				\ 'yellow':     ['#E0AF68',   '179',  'Yellow'],
				\ 'green':      ['#9ECE6A',   '107',  'Green'],
				\ 'blue':       ['#7AA2F7',   '110',  'Blue'],
				\ 'purple':     ['#ad8ee6',   '176',  'Magenta'],
				\ 'grey':       ['#444B6A',   '246',  'LightGrey'],
				\ 'none':       ['NONE',      'NONE', 'NONE']
				\ }
elseif s:configuration.style ==# 'storm'
	let s:palette = {
				\ 'black':      ['#06080a',   '237',  'DarkGrey'],
				\ 'bg0':        ['#24283b',   '235',  'Black'],
				\ 'bg1':        ['#282d42',   '236',  'DarkGrey'],
				\ 'bg2':        ['#2f344d',   '236',  'DarkGrey'],
				\ 'bg3':        ['#333954',   '237',  'DarkGrey'],
				\ 'bg4':        ['#3a405e',   '237',  'Grey'],
				\ 'bg_red':     ['#ff7a93',   '203',  'Red'],
				\ 'diff_red':   ['#803d49',   '52',   'DarkRed'],
				\ 'bg_green':   ['#b9f27c',   '107',  'Green'],
				\ 'diff_green': ['#618041',   '22',   'DarkGreen'],
				\ 'bg_blue':    ['#7da6ff',   '110',  'Blue'],
				\ 'diff_blue':  ['#3e5380',   '17',   'DarkBlue'],
				\ 'fg':         ['#a9b1d6',   '250',  'White'],
				\ 'red':        ['#F7768E',   '203',  'Red'],
				\ 'orange':     ['#FF9E64',   '215',  'Orange'],
				\ 'yellow':     ['#E0AF68',   '179',  'Yellow'],
				\ 'green':      ['#9ECE6A',   '107',  'Green'],
				\ 'blue':       ['#7AA2F7',   '110',  'Blue'],
				\ 'purple':     ['#ad8ee6',   '176',  'Magenta'],
				\ 'grey':       ['#444B6A',   '246',  'LightGrey'],
				\ 'none':       ['NONE',      'NONE', 'NONE']
				\ }
endif
if (has('termguicolors') && &termguicolors) || has('gui_running')  " guifg guibg gui cterm guisp
	function! s:HL(group, fg, bg, ...)
		let hl_string = [ 'highlight', a:group, 'guifg=' . a:fg[0], 'guibg=' . a:bg[0], ]
		if a:0 >= 1
			if a:1 ==# 'undercurl'
				if !s:tmux|call add(hl_string, 'gui=undercurl')
				else|call add(hl_string, 'gui=underline')
				endif
				call add(hl_string, 'cterm=underline')
			else|call add(hl_string, 'gui=' . a:1)|call add(hl_string, 'cterm=' . a:1)
			endif
		else|call add(hl_string, 'gui=NONE')|call add(hl_string, 'cterm=NONE')
		endif
		if a:0 >= 2|call add(hl_string, 'guisp=' . a:2[0])|endif
		execute join(hl_string, ' ')
	endfunction
elseif s:t_Co >= 256
	function! s:HL(group, fg, bg, ...)
		let hl_string = [ 'highlight', a:group, 'ctermfg=' . a:fg[1], 'ctermbg=' . a:bg[1]]
		if a:0 >= 1
			if a:1 ==# 'undercurl'|call add(hl_string, 'cterm=underline')
			else|call add(hl_string, 'cterm=' . a:1)
			endif
		else|call add(hl_string, 'cterm=NONE')
		endif
		execute join(hl_string, ' ')
	endfunction
else  " ctermfg ctermbg cterm
	function! s:HL(group, fg, bg, ...)
		let hl_string = [ 'highlight', a:group, 'ctermfg=' . a:fg[2], 'ctermbg=' . a:bg[2]]
		if a:0 >= 1
			if a:1 ==# 'undercurl'|call add(hl_string, 'cterm=underline')
			else|call add(hl_string, 'cterm=' . a:1)
			endif
		else|call add(hl_string, 'cterm=NONE')
		endif
		execute join(hl_string, ' ')
	endfunction
endif
if s:configuration.transparent_background
	call s:HL('Normal', s:palette.fg, s:palette.none)
	call s:HL('Terminal', s:palette.fg, s:palette.none)
	call s:HL('EndOfBuffer', s:palette.bg0, s:palette.none)
	call s:HL('FoldColumn', s:palette.grey, s:palette.none)
	call s:HL('Folded', s:palette.grey, s:palette.none)
	call s:HL('SignColumn', s:palette.fg, s:palette.none)
	call s:HL('ToolbarLine', s:palette.fg, s:palette.none)
else
	call s:HL('Normal', s:palette.fg, s:palette.bg0)
	call s:HL('Terminal', s:palette.fg, s:palette.bg0)
	call s:HL('EndOfBuffer', s:palette.bg0, s:palette.bg0)
	call s:HL('FoldColumn', s:palette.grey, s:palette.bg1)
	call s:HL('Folded', s:palette.grey, s:palette.bg1)
	call s:HL('SignColumn', s:palette.fg, s:palette.bg1)
	call s:HL('ToolbarLine', s:palette.fg, s:palette.bg2)
endif
call s:HL('ColorColumn', s:palette.none, s:palette.bg1)
call s:HL('Conceal', s:palette.grey, s:palette.none)
if s:configuration.cursor ==# 'auto'|call s:HL('Cursor', s:palette.none, s:palette.none, 'reverse')
elseif s:configuration.cursor ==# 'red'|call s:HL('Cursor', s:palette.bg0, s:palette.red)
elseif s:configuration.cursor ==# 'green'|call s:HL('Cursor', s:palette.bg0, s:palette.green)
elseif s:configuration.cursor ==# 'blue'|call s:HL('Cursor', s:palette.bg0, s:palette.blue)
endif
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
call s:HL('CursorColumn', s:palette.none, s:palette.bg1)
call s:HL('CursorLine', s:palette.none, s:palette.bg1)
call s:HL('LineNr', s:palette.grey, s:palette.none)
if &relativenumber == 1 && &cursorline == 0|call s:HL('CursorLineNr', s:palette.fg, s:palette.none)
else|call s:HL('CursorLineNr', s:palette.fg, s:palette.bg1)
endif
call s:HL('DiffAdd', s:palette.none, s:palette.diff_green)
call s:HL('DiffChange', s:palette.none, s:palette.diff_blue)
call s:HL('DiffDelete', s:palette.none, s:palette.diff_red)
call s:HL('DiffText', s:palette.none, s:palette.none, 'reverse')
call s:HL('Directory', s:palette.green, s:palette.none)
call s:HL('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call s:HL('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call s:HL('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call s:HL('MoreMsg', s:palette.blue, s:palette.none, 'bold')
call s:HL('IncSearch', s:palette.bg0, s:palette.bg_red)
call s:HL('Search', s:palette.bg0, s:palette.bg_green)
call s:HL('MatchParen', s:palette.none, s:palette.bg4)
call s:HL('NonText', s:palette.bg4, s:palette.none)
call s:HL('Whitespace', s:palette.bg4, s:palette.none)
call s:HL('SpecialKey', s:palette.bg4, s:palette.none)
call s:HL('Pmenu', s:palette.fg, s:palette.bg2)
call s:HL('PmenuSbar', s:palette.none, s:palette.bg2)
if s:configuration.menu_selection_background ==# 'blue'
	call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_blue)
	call s:HL('WildMenu', s:palette.bg0, s:palette.bg_blue)
elseif s:configuration.menu_selection_background ==# 'green'
	call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_green)
	call s:HL('WildMenu', s:palette.bg0, s:palette.bg_green)
elseif s:configuration.menu_selection_background ==# 'red'
	call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_red)
	call s:HL('WildMenu', s:palette.bg0, s:palette.bg_red)
endif
call s:HL('PmenuThumb', s:palette.none, s:palette.grey)
call s:HL('Question', s:palette.yellow, s:palette.none)
call s:HL('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
call s:HL('SpellCap', s:palette.yellow, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('SpellLocal', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
call s:HL('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
call s:HL('StatusLine', s:palette.fg, s:palette.bg3)
call s:HL('StatusLineTerm', s:palette.fg, s:palette.bg3)
call s:HL('StatusLineNC', s:palette.grey, s:palette.bg1)
call s:HL('StatusLineTermNC', s:palette.grey, s:palette.bg1)
call s:HL('TabLine', s:palette.fg, s:palette.bg4)
call s:HL('TabLineFill', s:palette.grey, s:palette.bg1)
call s:HL('TabLineSel', s:palette.bg0, s:palette.bg_red)
call s:HL('VertSplit', s:palette.black, s:palette.none)
call s:HL('Visual', s:palette.none, s:palette.bg3)
call s:HL('VisualNOS', s:palette.none, s:palette.bg3, 'underline')
call s:HL('QuickFixLine', s:palette.blue, s:palette.none, 'bold')
call s:HL('Debug', s:palette.yellow, s:palette.none)
call s:HL('debugPC', s:palette.bg0, s:palette.green)
call s:HL('debugBreakpoint', s:palette.bg0, s:palette.red)
call s:HL('ToolbarButton', s:palette.bg0, s:palette.bg_blue)
call s:HL('Type', s:palette.blue, s:palette.none, 'italic')
call s:HL('Structure', s:palette.blue, s:palette.none, 'italic')
call s:HL('StorageClass', s:palette.blue, s:palette.none, 'italic')
call s:HL('Identifier', s:palette.orange, s:palette.none, 'italic')
call s:HL('Constant', s:palette.orange, s:palette.none, 'italic')
call s:HL('PreProc', s:palette.red, s:palette.none)
call s:HL('PreCondit', s:palette.red, s:palette.none)
call s:HL('Include', s:palette.red, s:palette.none)
call s:HL('Keyword', s:palette.red, s:palette.none)
call s:HL('Define', s:palette.red, s:palette.none)
call s:HL('Typedef', s:palette.red, s:palette.none)
call s:HL('Exception', s:palette.red, s:palette.none)
call s:HL('Conditional', s:palette.red, s:palette.none)
call s:HL('Repeat', s:palette.red, s:palette.none)
call s:HL('Statement', s:palette.red, s:palette.none)
call s:HL('Macro', s:palette.purple, s:palette.none)
call s:HL('Error', s:palette.red, s:palette.none)
call s:HL('Label', s:palette.purple, s:palette.none)
call s:HL('Special', s:palette.purple, s:palette.none)
call s:HL('SpecialChar', s:palette.purple, s:palette.none)
call s:HL('Boolean', s:palette.purple, s:palette.none)
call s:HL('String', s:palette.yellow, s:palette.none)
call s:HL('Character', s:palette.yellow, s:palette.none)
call s:HL('Number', s:palette.purple, s:palette.none)
call s:HL('Float', s:palette.purple, s:palette.none)
call s:HL('Function', s:palette.green, s:palette.none)
call s:HL('Operator', s:palette.red, s:palette.none)
call s:HL('Title', s:palette.red, s:palette.none, 'bold')
call s:HL('Tag', s:palette.orange, s:palette.none)
call s:HL('Delimiter', s:palette.fg, s:palette.none)
call s:HL('Comment', s:palette.grey, s:palette.none, 'italic')
call s:HL('SpecialComment', s:palette.grey, s:palette.none, 'italic')
call s:HL('Todo', s:palette.blue, s:palette.none, 'italic')
call s:HL('Ignore', s:palette.grey, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline')
call s:HL('Fg', s:palette.fg, s:palette.none)
call s:HL('Grey', s:palette.grey, s:palette.none)
call s:HL('Red', s:palette.red, s:palette.none)
call s:HL('Orange', s:palette.orange, s:palette.none)
call s:HL('Yellow', s:palette.yellow, s:palette.none)
call s:HL('Green', s:palette.green, s:palette.none)
call s:HL('Blue', s:palette.blue, s:palette.none)
call s:HL('Purple', s:palette.purple, s:palette.none)
call s:HL('RedItalic', s:palette.red, s:palette.none, 'italic')
call s:HL('BlueItalic', s:palette.blue, s:palette.none, 'italic')
call s:HL('OrangeItalic', s:palette.orange, s:palette.none, 'italic')
let s:terminal = {
			\ 'black':s:palette.black,'red':s:palette.red,'yellow':s:palette.yellow,'green':s:palette.green,
			\ 'cyan':s:palette.orange,'blue':s:palette.blue,'purple':s:palette.purple,'white':s:palette.fg
			\ }
let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
			\ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
			\ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]

" vim: set fen ft=vim fdm=marker fmr={{{,}}}:

set ruler                " 总是显示光标位置
