set nocompatible
filetype off

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" Bundle List - Original Repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'amjith/rtf-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'tomasr/molokai'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'jiangmiao/auto-pairs'
"Plugin 'Yggdroot/indentLine'
Plugin 'ElmCast/elm-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'alvan/vim-closetag'
Plugin 'godlygeek/tabular'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'vim-airline/vim-airline'

" Vim-script Repo
Plugin 'L9'
"Plugin 'AutoComplPop'
"Plugin 'Auto-Pairs'
Plugin 'matchit.zip'
Plugin 'vimwiki'
Plugin 'EasyGrep'
Plugin 'VisIncr'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

" All of the Plugins must be added before the following line
call vundle#end()

set background=light
"if has("gui_running")
    "colorscheme solarized
"else
"colorscheme badwolf
colorscheme solarized
"endif

if has("syntax")
  syntax on
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif


set hlsearch		 " Highlight search term
set showcmd		     " Show (partial) command in status line.
set showmatch		 " Show matching brackets.
set ignorecase		 " Do case insensitive matching
set smartcase		 " Do smart case matching
set incsearch		 " Incremental search
set autowrite		 " Automatically save before commands like :next and :make
set hidden           " Hide buffers when they are abandoned
set mouse=a		     " Enable mouse usage (all modes)
set backspace=indent,eol,start			" backspace for dummys
set linespace=0		 " No extra spaces between rows
set winminheight=0	 " windows can be 0 line high 
set infercase        " Fix completion to work the same as search + smartcase
set ruler            " Show cursor position all the time
"set cursorline       " Highlight the current line
set autoindent       " Auto indent


" No bells
set visualbell t_vb=
set number		" Line number

" Tabs will be spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set backupdir=~/tmp
set directory=~/tmp
if has("autocmd")
  autocmd FileType html,css,scss,ruby,javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType markdown setlocal wrap linebreak nolist
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead *.es6 setfiletype javascript
endif

" Toggles & Switches (Leader commands) {{{1
let mapleader = ","
nmap <silent> <leader>s :set spell!<CR>

" http://stackoverflow.com/questions/2400264/is-it-possible-to-apply-vim-configurations-without-restarting/2400289#2400289
if has("autocmd")
  augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
  augroup END
endif


" Treat j and k as up and down on long lines in wrap mode.
nnoremap j gj
nnoremap k gk

" Visually select the text that was last edited/pasted
nmap gV `[v`]
nnoremap cn :cn<CR>
nnoremap cp :cp<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


" Use system clipboard
set clipboard=unnamed

set nowrap                     			" wrap long lines

" Set cwd from the path of the file being edited
set autochdir

"Use option key in mac as meta key
if has("gui_macvim")
    set macmeta
endif 

" Use the excuberant tags instead of the shitty ctags in OS X
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

set tm=500

" Vimwiki home
let g:vimwiki_list = [{'path': '~/Dropbox/notes/'}]

set wildmenu

" Leave the statusline visible
set laststatus=2
"Delete without clobbering clipboard
nnoremap x "_x
"Paste without clobbering clipboard in visual mode
vnoremap p "_dP

"Set colorcolumn to indicate the 80 char violation"
"set colorcolumn=80

" Search for tags file up the directory tree
set tags=tags;/

" F5 to insert current date.
nnoremap <F5> "=strftime("%y/%m/%d")<CR>P
inoremap <F5> <C-R>=strftime("%y/%m/%d")<CR>


" F2 to toggle paste-mode.
set pastetoggle=<F2>

" Ignore pylint errors. 
" E302 - Two blank lines before function definitions.
" E701 - multiple statmenets on one line (colon)
let g:pymode_lint_ignore = "E501,E302,E701,E128,E126"
let g:pymode_lint_cwindow = 1

" NERDTree Toggle.
map <leader>n :NERDTreeToggle<CR>

set t_Co=256 " Explicitly tell vim to support 256 colors

" Highlight chars greater than 80 chars
"highlight LongLine ctermbg=green guibg=green
"match LongLine '\%>80v.\+'

" Disable <CR> for AutoPairs
let g:AutoPairsMapCR = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown,javascript setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

set wildignore+=*.pyc

" Ctrlp config
let g:ctrlp_extensions = ['tag']
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc|so|dll)$',
  \ }

let g:EasyGrepMode = 2
let g:indent_guides_guide_size = 1

" air-line config
let g:airline#extensions#tabline#enabled = 1

" Natural Splits
set splitbelow
set splitright

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jshint']

" YouCompleteMe config
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filepath_completion_use_working_dir = 1

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" A function that can save the status before executing a command.
" Useful when removing trailing spaces without losing the last cursor position.
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

nmap _$ :call Preserve("%s/\\s\\+$//e")<CR>
nmap _= :call Preserve("normal gg=G")<CR>

autocmd BufWritePre *.go,*.py,*.js,*.es6,*.elm :call Preserve("%s/\\s\\+$//e")

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"au FileType go au BufWritePre <buffer> Fmt

" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<C-s>"
let g:UltiSnipsJumpForwardTrigger="<C-f>"
let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:elm_format_autosave = 1

" Always set the default shell to bash. This is needed to make syntastic work
" correctly.
set shell=/bin/bash

let g:indentLine_char = '│'
nnoremap <leader>i :IndentLinesToggle<CR>

" Uses silversurfer to do Ctrl-P completion.
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Show full path of the file in statusline.
set statusline+=%F

" Enable automatic close tag for the following file types.
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.jsx,*.js"

" Limit syntax highlighting to lines under 200 chars.
set synmaxcol=200
