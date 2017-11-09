set encoding=utf-8
set fileencodings=utf-8,euckr

"filetype off

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where vundle should install plugins
"call vundle#begin('~/some/path/here')

" let vundle manage vundle, required
"plugin 'gmarik/vundle.vim'

"plugin 'digitaltoad/vim-pug'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set bs=indent,eol,start
set cindent
set autoindent
set ts=4
set shiftwidth=4
set hlsearch
set nu
set noexpandtab 


set csprg=/usr/bin/cscope
set csto=0
set cst
set csverb

if filereadable("./cscope.out")
    cs add cscope.out
elseif filereadable("./../cscope.out")
    cs add ../cscope.out
elseif filereadable("./../../cscope.out")
    cs add ../../cscope.out
elseif filereadable("./../../../cscope.out")
    cs add ../../../cscope.out
endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	

au BufReadPost *
	\ if line("'\"") > 0 && line("'\"")  <= line("$") |
	\ exe "norm g`\"" |
	\ endif 

set tags=./tags,../tags,../../tags,../../../tags,../../../../tags
",../tags,../../tags,../../../tags,../../../../tags
"colorscheme ron
syntax on
filetype indent on

nmap <F10> :%!xxd<CR>
nmap <F11> :%!xxd -r<CR>

"---------------------------------------------------
" Tag List
"---------------------------------------------------
filetype on
nmap <F7> :TlistToggle<CR>
let Tlist_Ctags_Cmd="/usr/bin/ctags"
let Tlist_Inc_Winwidth=0
let Tlist_Exit_OnlyWindow=0

let Tlist_Auto_Open=0
let Tlist_Use_Right_Window=1 
"---------------------------------------------------
" Source Explorer
"---------------------------------------------------
nmap <F8> :SrcExplToggle<CR>

let g:SrcExpl_winHeight=20
let g:SrcExpl_refreshTime=100
let g:SrcExpl_jumpKey="<ENTER>"
let g:SrcExpl_gobackKey="<SPACE>"
let g:SrcExpl_isUpdateTags=0

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

"---------------------------------------------------
" NERD Tree
"---------------------------------------------------
let NERDTreeWinPos="left"
let NERDTreeIgnore=['\.o$']
let NERDTreeIgnore+=['\.d$']

nmap <F9> :NERDTreeToggle<CR>

"---------------------------------------------------
" Buffer Explorer
"---------------------------------------------------
"nmap <F5> :BufExplorer<CR>

" for OmniCppComplete
" ctags 기반으로 클래스 및 구조체 intellisense
" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude="\.svn"
" http://www.vim.org/scripts/script.php?script_id=1520
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let OmniCpp_SelectFirstItem = 2
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_LocalSearchDecl = 1

set history=4000
set hlsearch
"set hlsearch

set nowrap

set nocompatible
"filetype off
set rtp+=~/.vim/bundle/Vundle.vim 
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'crucerucalin/qml.vim'
call vundle#end() 
filetype plugin indent on 

syntax enable  
filetype plugin on  
set number  

"let g:rehash256 = 1
"colorscheme molokai
"
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_builtins' : 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins' : 1
  \     }
  \   }
  \ }


let g:go_disable_autoinstall = 0

" Highlight
let g:go_highlight_functions = 1  
let g:go_highlight_methods = 1  
let g:go_highlight_structs = 1  
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
let g:go_highlight_methods = 1

let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }

map <C-n> :NERDTreeToggle<CR>
nmap <F2> :20Ve<CR>
nmap <F3> :Tlist<CR>
nmap <F4> <C-w>10<
nmap <F5> <C-w>10>

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'dNitro/vim-pug-complete', { 'for': ['jade', 'pug'] }
call plug#end()


" ======================= test
"nnoremap <leader>u1 :normal yypVr=<cr>

"function! Underline(level)
"	if a:level == 1
		"normal! yypVr=
	"elseif a:level == 2
		"normal! yypVr-
	"else
		"normal! I#####
	"endif
"endfunction
function! Calc()
python3 <<endPython
import vim
currentLine = vim.current.line
result = eval(currentLine)
(row, col) = vim.current.window.cursor
vim.current.buffer[row-1] += " = " + str(result)
endPython
endfunction

py3 myClipBoard = ""

py3 <<EOP
def getExtension(str):
# 필요한 확장자가 있으면 상황에 맞춰서 주석 특수문자 추가
    comments = {
        "py" : "#",
        "c" : "//",
        "go" : "//",
        ".sh" : "#",
        "h" : "//",
		"js": "//",
		"pug":"//"
        }

    try:
        result = comments[str]
    except:
        result = ''

    return result

def toComment(line, com):
	comstr = line.lstrip()[:len(com)]
	find = comstr.find(com)

	if find >= 0:
		line = line.replace(com, "", 1)
	else:
		spaceless = line.lstrip()
		line = line.replace(spaceless, com + spaceless)
	return line


logPath = "../vimlog/"

def writeLog():
	#현재 날짜 디렉토리에 편집한 파일 로그 적기
	pass


EOP

"c## current##
function! CpWord()
python3 <<endPython
import vim

cWord = vim.eval('expand("<cword>")')
myClipBoard = cWord;
print(myClipBoard)
#f = open("./word", "w")
#f.write(cWord)
#f.close()
#vim.command("normal BcW%s" % "New Word" + cWord)

endPython
endfunction

"파일 확장자 가져와 실행하기 
function! GenRun()
py3 import vim
python3 <<EOP

path = vim.eval('expand("%:p")') #파일 전체 경로
ve = vim.eval('expand("%:e")')   #확장자
#print(ve)

#파일별 기능#
if ve == "py":
	vim.command("!python3 %s"%path)
elif ve == "go":
	vim.command("!go run %s"%path)
elif ve == "js":
	vim.command("!npm start")
else:
	print("Unsupported file type!")

EOP
endfunction

function! Comments()
py3 <<EOP
ve = vim.eval('expand("%:e")')
com = getExtension(ve)

line = vim.current.line
line = toComment(line, com)
vim.current.line = line

EOP
endfunction

map <C-/> :py3 print("????")<cr>
map <C-h> :call Comments()<cr>
map <F12> :call GenRun()<cr>


execute pathogen#infect()
autocmd BufWritePre * :py3 print("Hello World\n")



