set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctags.vim'
Plugin 'taglist.vim'
Plugin 'Markdown'
Plugin 'instant-markdown.vim'
Plugin 'plasticboy/vim-markdown'
" Plugin 'jQuery'
" Plugin 'othree/html5.vim'
call vundle#end()            " required
filetype plugin indent on       " load file type plugins + indentation

" settings
syntax enable
syntax on
"
let mapleader=','
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
" colorscheme molokai
"
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set cul
"
set laststatus=2 
set number
set noshowmode
"
set tabstop=4
set shiftwidth=4
set softtabstop=4
"
set expandtab
set smarttab
set autoindent
set smartindent
set ruler
set ignorecase
set hls
set foldmethod=syntax
set showcmd
"
" " backup
set nobackup
set nowb
set noswapfile
"
"" search
set hlsearch
set incsearch

" backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"
" " javascript settings
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
"
"" html5 settings
let g:html5_event_handler_attributes_complete = 0

" nerdtree settings
"autocmd vimenter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <silent> <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"
" " airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
"" ctags settings
let Tlist_Ctags_Cmd ='/usr/local/Cellar/ctags/5.8_1/bin/ctags'  "这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个，Centos下配置注销这行即可。

" taglist settings
let Tlist_Use_Right_Window = 1 "让taglist窗口出现在Vim的右边
let Tlist_File_Fold_Auto_Close = 1
"当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_Show_One_File = 1 "只显示一个文件中的tag，默认为显示多个
let Tlist_Sort_Type ='name'
" "Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_GainFocus_On_ToggleOpen = 1
" "Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_WinWidth = 32 "设置窗体宽度为32，可以根据自己喜好设置
map <silent> <F9> :TlistToggle <CR>
"
"" emment settings
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:emmet_html5 = 0

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>' 
let g:user_emmet_expandabbr_key='<Tab>'
"
"" neocompletecache settings
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" ctrlp settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linuxkk"


"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter



" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>
"nnoremap <silent> <F11> :BufExplorer<CR>
"nnoremap <silent> <s-F11> :ToggleBufExplorer<CR>
"nnoremap <silent> <m-F11> :BufExplorerHorizontalSplit<CR>
"nnoremap <silent> <c-F11> :BufExplorerVerticalSplit<CR>
