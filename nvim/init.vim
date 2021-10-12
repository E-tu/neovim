"===============================================================================================
"                        _                              __ _
" _ __ ___  _   _  __   _(_)_ __ ___     ___ ___  _ __  / _(_) __ _
"| '_ ` _ \| | | | \ \ / / | '_ ` _ \   / __/ _ \| '_ \| |_| |/ _` |
"| | | | | | |_| |  \ V /| | | | | | | | (_| (_) | | | |  _| | (_| |
"|_| |_| |_|\__, |   \_/ |_|_| |_| |_|  \___\___/|_| |_|_| |_|\__, |
"           |___/                                             |___/
"
"==============================================================================================

"==============================================================================================
set nowrap              " 设置不自动换行
set fileencoding=utf-8
set laststatus=2
set magic
autocmd! bufwritepost .vimrc source %   "vimrc文件修改之后自动加载。 linux
set nu"设置行号
syntax on"语法高亮
set mouse=a"启用鼠标
set autoindent"c语言自动对齐
"set relativenumber"相对行号
set cindent shiftwidth=4"tab键为4个字符
syntax enable
set t_Co=256
filetype plugin on
"==============================================================================================
nmap <F7> :call Theme()<CR>
function! Theme()
    let s:current_theme = substitute(execute("colorscheme"),"\n","","")
    if s:current_theme=="solarized"
	execute "colorscheme default"
    endif
    if s:current_theme=="default"
	execute "colorscheme solarized"
    endif
endfunction
"==============================================================================================
"one key to bianyi *.c
nmap <F4> :call CompileRunGcc()<CR>
function! CompileRunGcc()
  execute "w"
  if &filetype == 'c'
    if !isdirectory('build')
      execute "!mkdir build"
    endif
    execute "!gcc % -o build/%<"
    execute "!time ./build/%<"
  endif
  if &filetype == 'cpp'
    if !isdirectory('build')
      execute "!mkdir build"
    endif
    execute "!g++ % -o build/%<"
    execute "!time ./build/%<"
  endif
  if &filetype == 'html'
      execute "!google-chrome-stable % &"
  endif
  if &filetype == 'markdown'
      execute "!google-chrome-stable % &"
  endif
  if &filetype == 'python'
      execute "!python3 %"
  endif
endfunction
"==============================================================================================




"==============================================================================================
call plug#begin('~/.vim/plugged')
"-----------------------------------------------------------------------------------------------
Plug 'fatih/vim-go'
Plug 'jiangmiao/auto-pairs'
"Plug 'sndnvaps/gocode'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
"colorscheme NeoSolarized
"set background=dark
colorscheme default
"let g:airline_theme='one'
"-----------------------------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"-----------------------------------------------------------------------------------------------
Plug 'neomake/neomake'
"-----------------------------------------------------------------------------------------------
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'google-chrome-stable'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
nmap <C-s> <Plug>MarkdownPreview
nmap <M-s> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle
"-----------------------------------------------------------------------------------------------
Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>    
"let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
"let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"autocmd vimenter * if !argc()|NERDTree|endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"-----------------------------------------------------------------------------------------------
Plug 'itchyny/lightline.vim' 
"-----------------------------------------------------------------------------------------------
Plug 'Yggdroot/indentLine'
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进
let g:molokai_original = 1
let g:rehash256 = 1
"-----------------------------------------------------------------------------------------------
Plug 'chxuan/change-colorscheme'
set clipboard+=unnamedplus
map <F12> :NextColorScheme<CR>
imap <F12> <ESC> :NextColorScheme<CR>
map <F11> :PreviousColorScheme<CR>
imap <F11> <ESC> :PreviousColorScheme<CR>
"-----------------------------------------------------------------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"-----------------------------------------------------------------------------------------------
Plug 'junegunn/fzf.vim'
"-----------------------------------------------------------------------------------------------
Plug 'RRethy/vim-illuminate'
"-----------------------------------------------------------------------------------------------
Plug 'preservim/nerdcommenter'
"-----------------------------------------------------------------------------------------------
Plug 'majutsushi/tagbar'
let g:tagbar_width=15
nnoremap <silent> <F9> :TagbarToggle<CR> "   
"-----------------------------------------------------------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"-----------------------------------------------------------------------------------------------
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips', 'UltiSnips']
"-----------------------------------------------------------------------------------------------
Plug 'honza/vim-snippets'

call plug#end()
"==============================================================================================






