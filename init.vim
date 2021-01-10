" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @hylxiaohua

" Checkout-list
" vim-esearch
" fmoralesc/worldslice
" SidOfc/mkdx


" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
" set clipboard=unnamedplus
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set cursorcolumn
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100 "刷新swap文件所需毫秒数"
set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
let g:terminal_color_0  = '#000000'
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
let maplocalleader=","

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Open Startify
"noremap <LEADER>st :Startify<CR>

" make Y to copy till the end of the line
"nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
"noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
"nnoremap <LEADER>tt :%s/    /\t/g
"vnoremap <LEADER>tt :s/    /\t/g

" Folding
" noremap <silent> <LEADER>o za

" Open up lazygit
noremap \g :Git
noremap <c-g> :tabe<CR>:-tabmove<CR>:term lazygit<CR>
nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>

noremap <silent> \v v$h

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" H key: go to the start of the line
noremap <silent> H 0
" L key: go to the end of the line
noremap <silent> L $

" Ctrl + U or E will move up/down the view port without moving the cursor
"noremap <C-U> 5<C-y>
"noremap <C-E> 5<C-e>

" move with abc_def_gh
" noremap <C-w> f_l
" noremap <C-b> F_;l

source /home/hyl/.config/nvim/cursor.vim

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Command Mode Cursor Movement
" ===
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-w> <S-Right>


" ===
" === Searching
" ===
noremap - N
noremap = n


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
" noremap <LEADER>w <C-w>w
noremap <LOCALLEADER>k <C-w>k
noremap <LOCALLEADER>j <C-w>j
noremap <LOCALLEADER>h <C-w>h
noremap <LOCALLEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap ss <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srs <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tt :tabe<CR>
" Move around tabs with tn and ti
noremap tp :-tabnext<CR>
noremap tn :+tabnext<CR>
noremap tf :tabfirst<CR>
noremap tl :tablast<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
"nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
noremap <localleader>tl :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>
noremap <localleader>tj :set splitright<CR>:vsplit<CR>:res +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
" noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

" find and replace
noremap \s :%s///g<left><left><left>

" set wrap
nnoremap <F4> :set wrap! wrap?<CR>

" press f10 to show hlgroup
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Compile function
noremap rr :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc


" ===
" === Install Plugins with Vim-Plug
" ===

call plug#begin('~/.config/nvim/plugged')

" 用途: 浮动窗口终端
" FloaterNew/toggle/prev/next/
" msend--发送指定行到teminal
" 可以设置term的位置、透明度、边框
" 打开时term所在的目录
" 如果在term中打开一个文件，会在vim中以split vsp等打开
" 还有个floatsend的很有用
" 可以通过coclist切换floaterm的buffer
" fzf不能用，没找到原因
Plug 'voldikss/vim-floaterm'


" 用途：一个颜色拾取器
" <alt-r> <alt-v> <alt-w>可以分别rgb hsl rgba下选中一个颜色
" 自动转换成对应的值
" 相关配置：
" 1. 转换后的值的大小写
" 2. 几种格式的相互转换
" 3. 指定外部的颜色拾取器
" Plug 'KabbAmine/vCoolor.vim'

Plug 'liuchengxu/vim-which-key'

" ################### line ######################
" 用途：最底下的状态栏，支持coc vista等
" Plug 'theniceboy/eleline.vim'
Plug 'liuchengxu/eleline.vim'
"A scrollbar for Vim statusline.
Plug 'ojroques/vim-scrollstatus'
Plug 'bling/vim-bufferline'
Plug 'Yggdroot/indentLine'
Plug 'bpietravalle/vim-bolt'
" let g:indentLine_setColors = 0
let g:indentLine_char = '|'

" ################### 颜色主题 ######################
" Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
"Plug 'arzg/vim-colors-xcode'

" ################### 高亮 ######################

" 用途：给不同的变量不同的颜色，给力
" :SemanticHighlightToggle
Plug 'jaxbot/semantic-highlight.vim'
" 高亮
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" 用途：
" 可以高亮当前光标下的变量
" 可配置的地方如下：
" 1. 触发延迟
" 2. 样式，默认是高亮,但不明显，可改为下划线
" 3. 设置文件过滤功能
" 4. 设置语言过滤功能(比如c的文件名和注释中的同名变量)
Plug 'RRethy/vim-illuminate'

" ############## File navigation ##################

"" 用途：tags ag的可视化，但没有这个，:FZF也可以用
Plug 'junegunn/fzf.vim'
" Plug 'yuki-ycino/fzf-preview.vim'
" 离线安装
" Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
" 在线安装,manjaro上直接pacman即可，因此注释
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" 用途：ranger浮动窗口
Plug 'kevinhwang91/rnvimr'

" 用途：更改project的根目录
Plug 'airblade/vim-rooter'

" 用途：一个跳转工具，简直碉堡。
" AnyJump：会查找当前光标下的单词的定义和引用，以一个浮动窗口的形式体现
" AnyJumpVisual：同上，在visual模式下使用
" AnyJumpBack：会打开之前jump的文件，实测好像有问题
" AnyJumpLastResult：重新打开浮动窗口
" 在浮动窗口的操作：
" o:open  s:split v:vsplit t:tab q:exit
" p:preview -赞
" L: 换了种显示方式
" b: 跳到开头
" r：references 打开或关闭references
" T：group by file
" 配置：
" 就是针对以上功能的开闭，显示的样式，还有查找器(ag,rg)等
Plug 'pechorin/any-jump.vim'

" ############## Tag ##################
" 用途:tag列表
" T  --加载ctags的符号
" :Vista coc --加载coc的符号,符号更全一些
" :Vista finder coc/ctags -- 查找符号
Plug 'liuchengxu/vista.vim'   "按 T 触发

" ############## Debugger ##################

" 目前neovim的有些功能还没实现，是一个开发中的插件
" 支持多种语言
" ./install_gadget.py 后选择要安装的gadgets
" 需要写一个vimsepector.json文件，类似于Lsp的那种文件
" 插件基于DAP协议(Debug Adapter Protocol)，类似于LSP
" 每一个gadget会有一个gadgets.json，和vimsepector.json类似
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}

" ############# Auto Complete ################
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 用途：可以在vim中补全 邻近的tmux的pane中的内容
" 没有快捷键，直接用
" 配置：选择触发的方式
Plug 'wellle/tmux-complete.vim'

" ############## Snippets #################
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" ############# Undo Tree ##################
" 用途：临时恢复文件，救命用的
" <leader,L>触发
Plug 'mbbill/undotree'

" ############### Git ###################
" This plugin provides syntax highlighting and up-to-date code snippets for .gitignore file.
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }

" 用途：命令行模式方便进行git操作
" :Git push/commit
Plug 'tpope/vim-fugitive'

" 用途：高亮于文件改动的内容
"Plug 'mhinz/vim-signify'

" 用途：git diff的preview插件
" :GitGutterLineHighLightEnable  --hunk高亮
" :GitGutterLineHighLightToggle  --enable/disable切换
" :GitGutterLineNrHighLightToggle --neovim中可在左侧显示修改类型和行号
" :GitGutterSignToogle --只有修改类型
" hunk：修改块，就是diff后的>>> <<<之间的内容
" next hunk: <leader>g+
" previos hunk: <leader>g-
" :GitGutterQuickFix 将gutter转入quickfix
" 可以用g:gitgutter_use_location_list转入location list
" 撤销 undohunk
" stagehunk：相当于commit了这个hunk的前一步
" 预览: H
" ic ac --类似vim的iw 和 aw
" 折叠非hunk：<leader>gf
" 可在statusline显示状态
" :currentFormatter  当前的format
" next/prev format 备选
" 可以更改优先级，同一个文件的不同部分执行不同的format等t
Plug 'airblade/vim-gitgutter'

" 用途：预览git commit提交记录
Plug 'cohama/agit.vim'

" 用途：类似与显示commit差异
Plug 'junkblocker/git-time-lapse'

" ########## AutoFormat ##################
" 按\f触发，试了下c++下，完全是垃圾
" 支持多种语言，每种语言用一种不同的format来执行，比如c++是clang
" 可以自由选择，也可以自定义，设置过滤等。
" :currentFormatter  当前的format
" next/prev format 备选
" 可以更改优先级，同一个文件的不同部分执行不同的format等
Plug 'Chiel92/vim-autoformat'

" ################## Tex ###################
Plug 'lervag/vimtex'

" ################## CSharp ###################
" OmniSharp-vim is a plugin for Vim to provide IDE like abilities for C#.
Plug 'OmniSharp/omnisharp-vim'
" 用途：一种fuzzy finder
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" ############### 语言相关 #####################
Plug 'elzr/vim-json'
"Syntax highlighting for CJSON in Vim
Plug 'neoclide/jsonc.vim'
" Plug 'othree/html5.vim'
" Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jaxbot/browserlink.vim'
" Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }
" Plug 'keith/swift.vim'

" ################ Python ################
" 用途：折叠代码用的，只提供了折叠import，和注释的功能，
" zc/zo 折叠/展开
" 配置：
" g:SimpylFold_docstring_preview 会显示折叠后注释的第一行。
Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }

Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }

" 用途：语法高亮
" :Semshi enbale/disable/toggle/pause/highlight/clear
" rename
" error gotoerror
" goto (name|function|class) (next|prev|first|last)
" 配置：
" 1. group
" 2. mark_select_nodes：光标下单词在作用域的同名高亮
" 3. no_default_builin_highlight：关闭vim自带的python高亮
" 4. 简化maskup --不懂
" 5. 每次输入后更新highlight
" 6. 语法错误高亮
" 7. 延迟时间
" 8. g:semshi#self_to_attribute  --是否高亮self
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }

" 用途: 快速选中段落/folding等功能
" 快速选中段落：iP/aP
" object motions：]] 每级缩进间移动
"									[/]]M 可以跳转函数
"	fold: 建议选中，不然自带的za/zc很烂
"	highlight：缩进的高亮
"	自动缩进
"	easymotion
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }


" ################# Markdown ##################
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }

"根据markdown的标题，生成目录用的
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }

" 用途：管理bullet lists(就是md的有序/无序列表)。
" <c-d> 退回一级缩进
" <c-t> 增加一级缩进
Plug 'dkarter/bullets.vim'

" ################## Other filetypes ###################
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" ################# Editor Enhancement ################

"Plug 'Raimondi/delimitMate'

" 用途：处理 pairs""的插件
" 快速加括号：
"   input: (|){["foo"]} (press <M-}> at |)
"   output: ({["foo"]}|)
" 跳转到pair的结尾处
"		}
Plug 'jiangmiao/auto-pairs'

" 选中同一个单词，多光标同时修改 <c-k>触发,暂时还不知道怎么取消，回到上一个
" 用途：visual block模式的一个增强，很给力
" <c-down> <c-up> 可以解决，visual block没有列对齐的短板
" shift+arrow 字符可视模式
Plug 'mg979/vim-visual-multi'
" <leader-cn/cc>注释 cu反注释 ca切换注释样式
" <leader-c<space>> toggle
" <leader-cm> 多行注释
" <leader-cs> 如下形式：
"  /*
"  *
"  */
" <leader-cA> 在行尾添加注释
" <leader-cl> 左端对齐  cb 两端对齐(/**/)
"Plug 'scrooloose/nerdcommenter' 
" <leader> cn/u 普通模式块注释
" gc gc+motion gcc 普通模式/visual模式
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line

" 用途：true <-> false的转换
Plug 'theniceboy/antovim'  " 光标处 :Antovim

" 用途：surround.vim
" cs + xy  : x="" y=''
" ds + x : remove x
" ys + iw + x
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`

" 用途：快速选中
" <Enter>  选中当前光标下的被''之类包裹的text <BS>可撤销
Plug 'gcmt/wildfire.vim'

" 用途：快速选中 = 后面的内容
" v/c/d/y + a + =  visual/change/delete/yank =后面的内容
Plug 'junegunn/vim-after-object'

" 用途：快速对齐
" 会那种表达式，整不明白，直接写死对齐等号
Plug 'godlygeek/tabular' 

" 用途：锁定大小写的
" Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock

" 用途：快速移动
" <leader><leader>h/l/w
" <leader><leader>f
" 还可以两个/n个字符搜索
" repeat
Plug 'easymotion/vim-easymotion'

" 用途：对f/F/t/T的一个增强。
" 首先，会高亮除当前单词出现的字母之外的首个字母。如果是第2次出现的，会用不同的颜色高亮
" 然后就没用途了。
" Plug 'unblevable/quick-scope' " quickscope 更高效的行内移动, f/F/t/T, 才触发

" 用途：自动折叠
" 还没摸索出怎么用, 这个真的不能生效
" Plug 'Konfekt/FastFold'
" 用途：显示寄存器的值
" "触发
Plug 'junegunn/vim-peekaboo'

" 用途：去除行尾空格
"Plug 'bronson/vim-trailing-whitespace'


"Plug 'wellle/context.vim'

" 用途：一种快速替换工具
" s+motion：用默认剪切板里的替换motion
" s+motion+motion(range motion)
" 自定义text object
" 替换确认
Plug 'svermeulen/vim-subversive'

" 用途：快速删除/修改参数
" 目前发现的用法只有 daa 删除一个参数
Plug 'theniceboy/argtextobj.vim'

" f/t{char} 后直接按f/t，代替;
Plug 'rhysd/clever-f.vim'

" 用途：一种分片的显示，整不明白
Plug 'chrisbra/NrrwRgn'


" 用途：
" 可以一行拆多行，多行拆一行，对c/python而言，简直是鸡肋。
"myfunction(arg1, arg2, arg3);
"myfunction(arg1,
				"arg2,
				"arg3);
"Plug 'AndrewRadev/splitjoin.vim'

" ############## For general writing ################
" 用途：一种全体居中，适合阅读的一种模式，有点像word的两端对齐
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" ################### Bookmarks ###################
" 打标记用的
"Plug 'kshenoy/vim-signature'

" 用途: 书签
" toggle书签  给书签加注释
" 书签移动  show all bookmarks
" move bookmarks
" 保存书签至一个文件 或者相反
" Plug 'MattesGroeger/vim-bookmarks'

" ################## Find & Replace ####################
" 用途：多个文件之间的替换和查找
" only search:  :F {pattern} {file-mask} [params]
" replace:  :Far {pattern} {replace-with} {file-mask} [params]
" 交互模式  :Farr = :Far  :Farf = :F
" 在弹出的窗口 执行:Fardo 执行替换
" :FarUndo  试了没反映
" :Refar ：执行上一条命令
" 在弹出的窗口执行 :help far.vim 可以获取帮助
"  里面的mapping很有用
" 还有一些扩展功能，详见extras
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" 用途：查找时 显示 x/y的
Plug 'osyo-manga/vim-anzu'

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'liuchengxu/vim-clap'
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
" 用途：异步执行任务
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
" 用途：一个日历加备忘录
Plug 'itchyny/calendar.vim'

" Other visual enhancement
" 给一些Needtree之类的加一些图标
Plug 'ryanoasis/vim-devicons'
" 用途：让不同层次的括号显示不同颜色
Plug 'luochen1990/rainbow'
" 用途：在tabline上显示 tabs/buffer/arglist
" ,x + ? ：显示所有的快捷键
" bn/bp/bq : buffer_next buffer_prev buffer_close
" to: cycle mode
" 过滤buffer-默认根据当前文件夹
" rename tab或者设置不同的图标
" 配置：
" enable-mapping: 开启默认的快捷键
Plug 'mg979/vim-xtabline'
" 用途：vim自带终端的一种增强
Plug 'wincent/terminus'

" Other useful utilities
" 用途：忘记加sudo了可以用
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" 用途：pdf阅读，
" 体验很差，公式完全没有
Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" ################# Dependencies ##################
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'kana/vim-textobj-user'
Plug 'roxma/nvim-yarp'

call plug#end()
set re=0

" experimental
set lazyredraw
"set regexpengine=1


" ===
" === Dress up my vim
" ===
set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
"let ayucolor="mirage"
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"let g:one_allow_italics = 1

"color dracula
"color one
color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================


" ===
" === eleline.vim
" ===
let g:airline_powerline_fonts = 0


" ==
" == GitGutter
" ==
" let g:gitgutter_signs = 0
let g:gitgutter_sign_allow_clobber = 0
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '░'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▒'
" autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap <LEADER>gp :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g+ :GitGutterNextHunk<CR>


" ===
" === coc.nvim
" ===
" fix the most annoying bug that coc has
"silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
"coc-clangd需要在Lsp的配置文件中去掉clangd,但自己编译的llvm7的clangd经常会断开，暂时未找到解决方案。
let g:coc_global_extensions = [
			\ 'coc-actions',
			\ 'coc-diagnostic',
			\ 'coc-explorer',
			\ 'coc-gitignore',
			\ 'coc-html',
			\ 'coc-json',
			\ 'coc-lists',
			\ 'coc-prettier',
			\ 'coc-pyright',
			\ 'coc-python',
			\ 'coc-snippets',
			\ 'coc-stylelint',
			\ 'coc-syntax',
			\ 'coc-tasks',
			\ 'coc-todolist',
			\ 'coc-translator',
			\ 'coc-vimlsp',
			\ 'coc-yank']
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
" shift+tab代替up
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" #代表匹配大小写
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" c-space触发补全
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
			call CocActionAsync('highlight')
			if (index(['vim','help'], &filetype) >= 0)
							execute 'h '.expand('<cword>')
			else
							call CocAction('doHover')
			endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
" autocmd CursorHold * silent call CocActionAsync('highlight')


nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" Open up coc-commands
nnoremap <localleader>cc :CocCommand<CR>
" Text Objects   没反应，一点都没
" xmap kf <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap kf <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" xmap kc <Plug>(coc-classobj-i)
" omap kc <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename) "只能替换一个单词
nmap <localleader>ce :CocCommand explorer<CR>
" coc-translator
nmap <localleader>ct <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>cn :CocCommand todolist.create<CR>
nnoremap <leader>cl :CocList todolist<CR>
nnoremap <leader>cu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>

" coc-snippets
" 在工作环境中，遇到了snippets不能tab补全和<c-j>失效的问题,开启下面即可。
let g:coc_snippet_next = '<tab>'
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'xiaohua'
autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc

"修复enter不能选中coc-snippet的问题
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"  "效果同上


" ===
" === vim-instant-markdown
" ===
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
" let g:instant_markdown_mathjax = 1
let g:instant_markdown_autoscroll = 1


" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_map_prefix = '<Leader>t'
let g:table_mode_cell_text_object_i_map = 'k<Bar>'
"noremap <leader>th [\|
"noremap <leader>tl ]\|
"noremap <leader>tk {\|
"noremap <leader>tj }\|

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
set rtp+=/home/david/.linuxbrew/opt/fzf
noremap <silent> <C-p> :Files<CR>
noremap <silent> <C-p> :Leaderf file<CR>
noremap <silent> <C-f> :Ag<CR>
noremap <silent> <C-h> :History<CR>
"noremap <C-t> :BTags<CR>
noremap <silent> <C-l> :Lines<CR>
noremap <silent> <C-w> :Buffers<CR>
"noremap ; :History:<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }


" ===
" === Leaderf
" ===
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_CommandMap = {
\   '<C-k>': ['<C-u>'],
\   '<C-j>': ['<C-e>'],
\   '<C-]>': ['<C-v>'],
\   '<C-p>': ['<C-n>'],
\}
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WildIgnore = {
        \ 'dir': ['.git', 'vendor', 'node_modules'],
        \ 'file': ['__vim_project_root']
        \}
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0


" ===
" === CTRLP (Dependency for omnisharp)
" ===
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlP'


" ===
" === vim-bookmarks
" ===
" let g:bookmark_no_default_key_mappings = 1
" nmap mt <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mn <Plug>BookmarkNext
" nmap mp <Plug>BookmarkPrev
" nmap mC <Plug>BookmarkClear
" nmap mX <Plug>BookmarkClearAll
" nmap mu <Plug>BookmarkMoveUp
" nmap me <Plug>BookmarkMoveDown
" nmap <Leader>g <Plug>BookmarkMoveToLine
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1


" ===
" === Undotree
" ===
noremap <Leader>L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> j <plug>UndotreeNextState
	nmap <buffer> k <plug>UndotreePreviousState
	nmap <buffer> J 5<plug>UndotreeNextState
	nmap <buffer> K 5<plug>UndotreePreviousState
endfunc


" ==
" == vim-multiple-cursor
" ==
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key = '<c-k>'
"let g:multi_cursor_select_all_word_key = '<a-k>'
"let g:multi_cursor_start_key = 'g<c-k>'
"let g:multi_cursor_select_all_key = 'g<a-k>'
"let g:multi_cursor_next_key = '<c-k>'
"let g:multi_cursor_prev_key = '<c-p>'
"let g:multi_cursor_skip_key = '<C-s>'
"let g:multi_cursor_quit_key = '<Esc>'


" ===
" === vim-visual-multi
" ===
"let g:VM_theme             = 'iceblue'
"let g:VM_default_mappings = 0
let g:VM_leader = {'default': ',', 'visual': ',', 'buffer': ','}
"let g:VM_maps = {}
"let g:VM_maps['Find Under']         = '<C-k>'
"let g:VM_maps['Find Subword Under'] = '<C-k>'
"let g:VM_maps['Find Next']         = ''
"let g:VM_maps['Find Prev']         = ''
"let g:VM_maps['Remove Region'] = 'q'
"let g:VM_maps['Skip Region'] = ''
"let g:VM_maps["Undo"]      = 'l'
"let g:VM_maps["Redo"]      = '<C-r>'


" ===
" === Far.vim
" ===
noremap <LEADER>f :F  **/*<left><left><left><left><left>
let g:far#mapping = {
		\ "replace_undo" : ["l"],
		\ }

" ===
" === Bullets.vim
" ===
" let g:bullets_set_mappings = 0
let g:bullets_enabled_file_types = [
			\ 'markdown',
			\ 'text',
			\ 'gitcommit',
			\ 'scratch'
			\]


" ===
" === Vista.vim
" ===
noremap <LEADER>v :Vista!!<CR>
noremap <c-t> :silent! Vista finder coc<CR>
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" function! NearestMethodOrFunction() abort
"   return get(b:, 'vista_nearest_method_or_function', '')
" endfunction
" set statusline+=%{NearestMethodOrFunction()}
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
let g:scrollstatus_size = 15


" ===
" === fzf-gitignore
" ===
noremap <LEADER>gi :FzfGitignore<CR>


" ===
" === Ultisnips
" ===
" inoremap <c-n> <nop>
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-e>"
" let g:UltiSnipsJumpBackwardTrigger="<c-n>"
" let g:UltiSnipsSnippetDirectories = [$HOME.'/.config/nvim/UltiSnips/', 'UltiSnips']
" silent! au BufEnter,BufRead,BufNewFile * silent! unmap <c-r>
" " Solve extreme insert-mode lag on macOS (by disabling autotrigger)
" augroup ultisnips_no_auto_expansion
"     au!
"     au VimEnter * au! UltiSnips_AutoTrigger
" augroup END


" ===
" === vimtex
" ===
"let g:vimtex_view_method = ''
let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'llpp'
let g:vimtex_mappings_enabled = 0
let g:vimtex_text_obj_enabled = 0
let g:vimtex_motion_enabled = 0
let g:vimtex_quickfix_mode = 1
set conceallevel=1
let g:tex_conceal = 'abdmg'

" ===
" === vim-calendar
" ===
"noremap \c :Calendar -position=here<CR>
noremap \\ :Calendar -view=clock -position=here<CR>
let g:calendar_google_calendar = 1
let g:calendar_google_task = 1
augroup calendar-mappings
	autocmd!
	" diamond cursor
	autocmd FileType calendar nmap <buffer> u <Plug>(calendar_up)
	autocmd FileType calendar nmap <buffer> n <Plug>(calendar_left)
	autocmd FileType calendar nmap <buffer> e <Plug>(calendar_down)
	autocmd FileType calendar nmap <buffer> i <Plug>(calendar_right)
	autocmd FileType calendar nmap <buffer> <c-u> <Plug>(calendar_move_up)
	autocmd FileType calendar nmap <buffer> <c-n> <Plug>(calendar_move_left)
	autocmd FileType calendar nmap <buffer> <c-e> <Plug>(calendar_move_down)
	autocmd FileType calendar nmap <buffer> <c-i> <Plug>(calendar_move_right)
	autocmd FileType calendar nmap <buffer> k <Plug>(calendar_start_insert)
	autocmd FileType calendar nmap <buffer> K <Plug>(calendar_start_insert_head)
	" unmap <C-n>, <C-p> for other plugins
	autocmd FileType calendar nunmap <buffer> <C-n>
	autocmd FileType calendar nunmap <buffer> <C-p>
augroup END


" ===
" === Anzu
" ===
set statusline=%{anzu#search_status()}
"nnoremap = n
"nnoremap - N


" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0


" ===
" === AutoFormat
" ===
nnoremap \f :Autoformat<CR>
let g:formatdef_custom_js = '"js-beautify -t"'
let g:formatters_javascript = ['custom_js']
au BufWrite *.js :Autoformat


" ===
" === OmniSharp
" ===
let g:OmniSharp_typeLookupInPreview = 1
let g:omnicomplete_fetch_full_documentation = 1

let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2
let g:OmniSharp_selector_ui = 'ctrlp'

autocmd Filetype cs nnoremap <buffer> gd :OmniSharpPreviewDefinition<CR>
autocmd Filetype cs nnoremap <buffer> gr :OmniSharpFindUsages<CR>
autocmd Filetype cs nnoremap <buffer> gy :OmniSharpTypeLookup<CR>
autocmd Filetype cs nnoremap <buffer> ga :OmniSharpGetCodeActions<CR>
autocmd Filetype cs nnoremap <buffer> <LEADER>rn :OmniSharpRename<CR><C-N>:res +5<CR>

sign define OmniSharpCodeActions text=💡

augroup OSCountCodeActions
	autocmd!
	autocmd FileType cs set signcolumn=yes
	autocmd CursorHold *.cs call OSCountCodeActions()
augroup END

function! OSCountCodeActions() abort
	if bufname('%') ==# '' || OmniSharp#FugitiveCheck() | return | endif
	if !OmniSharp#IsServerRunning() | return | endif
	let opts = {
				\ 'CallbackCount': function('s:CBReturnCount'),
				\ 'CallbackCleanup': {-> execute('sign unplace 99')}
				\}
	call OmniSharp#CountCodeActions(opts)
endfunction

function! s:CBReturnCount(count) abort
	if a:count
		let l = getpos('.')[1]
		let f = expand('%:p')
		execute ':sign place 99 line='.l.' name=OmniSharpCodeActions file='.f
	endif
endfunction


" ===
" === Colorizer
" ===
let g:colorizer_syntax = 1


" ===
" === vim-easymotion
" ===
" easymotion {{{
    let g:EasyMotion_smartcase = 1
		let g:EasyMotion_do_mapping = 0
		let g:EasyMotion_do_shade = 0
    "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    map <Leader><leader>h <Plug>(easymotion-linebackward)
    map <Leader><Leader>j <Plug>(easymotion-j)
    map <Leader><Leader>k <Plug>(easymotion-k)
    map <Leader><leader>l <Plug>(easymotion-lineforward)
		map <Leader><leader>w <Plug>(easymotion-w)
    " 重复上一次操作, 类似repeat插件, 很强大
    map <Leader><leader>. <Plug>(easymotion-repeat)
		map <leader><leader>f <Plug>(easymotion-bd-f)
		nmap <leader><leader>f <Plug>(easymotion-overwin-f)
" }}}

" ===
" === goyo
" ===
map <LEADER>y :Goyo<CR>


" ===
" === jsx
" ===
let g:vim_jsx_pretty_colorful_config = 1


" ===
" === fastfold
" ===
" nmap zuz <Plug>(FastFoldUpdate)
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'ze', 'zu']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1


" ===
" === tabular
" ===
vmap ga :Tabularize /=/l1c1


" ===
" === trailingwhitespace
" ===
"trailingwhitespace {{{
    "map <leader><space> :FixWhitespace<cr>
"}}}


" ===
" === vim-after-object
" ===
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ===
" === rainbow
" ===
let g:rainbow_active = 1


" ===
" === xtabline
" ===
let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 1
let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
noremap \p :echo expand('%:p')<CR>
" 不能做如下映射，不然b不能用了
" noremap bn :XTabNextBuffer<CR>
" noremap bp :XTabPrevBuffer<CR>
" noremap bq :XTabCloseBuffer<CR>


" ===
" === vim-session
" ===
"let g:session_directory = $HOME."/.config/nvim/tmp/sessions"
"let g:session_autosave = 'no'
"let g:session_autoload = 'no'
"let g:session_command_aliases = 1
"set sessionoptions-=buffers
"set sessionoptions-=options
"noremap sl :OpenSession<CR>
"noremap sS :SaveSession<CR>
"noremap ss :SaveSession
"noremap sc :SaveSession<CR>:CloseSession<CR>:q<CR>
"noremap so :OpenSession default<CR>
"noremap sD :DeleteSession<CR>
""noremap sA :AppendTabSession<CR>


" ===
" === context.vim
" ===
"let g:context_add_mappings = 0
"noremap <leader>ct :ContextToggle<CR>


" ===
" === suda.vim
" ===
cnoreabbrev sudowrite w suda://%
cnoreabbrev sw w suda://%


" ===
" === vimspector
" ===
let g:vimspector_enable_mappings = 'HUMAN'
function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=☛ texthl=Normal
sign define vimspectorBPDisabled text=☞ texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


" ===
" === reply.vim
" ===
"noremap <LEADER>rp :w<CR>:Repl<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rs :ReplSend<CR><C-w><C-l>a<CR><C-\><C-N><C-w><C-h>
"noremap <LEADER>rt :ReplStop<CR>


" ===
" === vim-markdown-toc
" ===
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'


" ===
" === rnvimr
" ===
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 0.7, 'height': 0.7}]


" ===
" === vim-subversive
" ===
nmap <localleader>ss <plug>(SubversiveSubstitute)
nmap <localleader>sl <plug>(SubversiveSubstituteLine)

" ===
" === vim-illuminate
" ===
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ===
" === vim-rooter
" ===
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ===
" === AsyncRun
" ===
noremap gp :AsyncRun git push<CR>


" ===
" === AsyncTasks
" ===
let g:asyncrun_open = 6



" ===
" === tcomment_vim
" ===
"nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>b
nmap <LEADER>cu g<b


" ===
" === NrrwRgn
" ===
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
noremap <c-y> :NR<CR>


" ===
" === any-jump
" ===
let g:any_jump_disable_default_keybindings = 1
nnoremap <leader>jj :AnyJump<CR>
xnoremap <leader>jj :AnyJump<CR>
" 可来回切换
nnoremap <leader>jb :AnyJumpBack<CR>
nnoremap <leader>jl :AnyJumpLastResults<CR>
let g:any_jump_window_width_ratio  = 0.8
let g:any_jump_window_height_ratio = 0.9
let g:any_jump_search_prefered_engine = 'rg'


" ===
" === vim-fugitive
" ===
" 每一行的最新改动
nnoremap gb :Gblame<CR>


" ===
" === floaterm
" ===
let g:floaterm_keymap_new    = '<localleader>tc'
let g:floaterm_keymap_prev   = '<localleader>tp'
let g:floaterm_keymap_next   = '<localleader>tn'
let g:floaterm_keymap_toggle = '<localleader>tt'
let g:floaterm_width = 0.8
let g:floaterm_winblend = 1
let g:floatern_position = 'center'


" ===
" === which key
" ===
let g:mapleader = " "
let g:maplocalleader = ","
" By default timeoutlen is 1000 ms
set timeout
set timeoutlen=500
let g:leader_map = {}
let g:localleader_map = {}
let g:mark_map = {'name' : 'mark or bookmark'}
let g:tab_map = {
			\ 'name' : 'tab management' ,
			\ 'p' : 'previous tab' ,
			\ 'n' : 'next tab' ,
			\ 't' : 'new tab' ,
			\ 'f' : 'first tab' ,
			\ 'l' : 'last tab' ,
			\ '1' : ['1gt' , 'tab 1']   ,
			\ '2' : ['2gt' , 'tab 2']   ,
			\ '3' : ['3gt' , 'tab 3']   ,
			\ 'm' : { 'name' : 'move' },
			\}
let g:split_map = {
			\ 'name' : 'split window key' ,
			\ 'h' : 'vsplit window and put cursor left' ,
			\ 'l' : 'vsplit window and put cursor right' ,
			\ 'j' : 'split window and put cursor bottom' ,
			\ 'k' : 'split window and put cursor up' ,
			\ 's' : 'change vsp to sp' ,
			\ 'v' : 'change sp to vsp' ,
			\ 'r' : { 'name' : 'rotate' },
			\}
let g:localleader_map['name'] = "neovim localleader key by hyl"
let g:leader_map['name'] = "neovim leader key by hyl"

let g:leader_map[' ']= { 'name' : 'easymotion' }
let g:leader_map['g'] = {'name' : 'git'}
let g:leader_map['c'] = {'name' : 'comment'}
let g:leader_map['t'] = {'name' : 'table mode'}

let g:leader_map.b = {
			\ 'name' : 'buffer' ,
			\ 'd' : ['bd'        , 'delete-buffer']   ,
			\ 'f' : ['bfirst'    , 'first-buffer']    ,
			\ 'l' : ['blast'     , 'last-buffer']     ,
			\ 'n' : ['bnext'     , 'next-buffer']     ,
			\ 'p' : ['bprevious' , 'previous-buffer'] ,
			\ '?' : ['Buffers'   , 'fzf-buffer']      ,
			\ }

autocmd VimEnter * call which_key#register(' ', "g:leader_map")
autocmd VimEnter * call which_key#register(',', "g:localleader_map")
autocmd VimEnter * call which_key#register('s', "g:split_map")
autocmd VimEnter * call which_key#register('t', "g:tab_map")
autocmd VimEnter * call which_key#register('m', "g:mark_map")
nnoremap <silent> s :WhichKey 's'<CR>
nnoremap <silent> t :WhichKey 't'<CR>
nnoremap <silent> m :WhichKey 'm'<CR>
nnoremap <silent> <leader> :WhichKey ' '<CR>
vnoremap <silent> <leader> :WhichKeyVisual ' '<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>
vnoremap <silent> <localleader> :WhichKeyVisual ','<CR>

" ===
" === Agit
" ===
nnoremap <LEADER>gl :Agit<CR>
let g:agit_no_default_mappings = 1

" ===================== End of Plugin Settings =====================


" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"


" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

