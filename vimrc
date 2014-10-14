set nocompatible
filetype off

let g:vundle_default_git_proto = 'git'

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" Bundle List - Original Repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'majutsushi/tagbar'
Plugin 'sjl/gundo.vim'
Plugin 'mutewinter/vim-indent-guides'
Plugin 'bling/vim-bufferline'
"Plugin 'davidhalter/jedi-vim'
Plugin 'amjith/rtf-highlight'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'
Plugin 'tomasr/molokai'
Plugin 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-vividchalk'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Rykka/riv.vim'
Plugin 'Rykka/InstantRst'
Plugin 'whatyouhide/vim-gotham'
Plugin 'chriskempson/base16-vim'

" Vim-script Repo
Plugin 'L9'
"Plugin 'AutoComplPop'
Plugin 'Auto-Pairs'
Plugin 'matchit.zip'
Plugin 'vimwiki'
Plugin 'EasyGrep'
Plugin 'VisIncr'

" Colors
Plugin 'altercation/vim-colors-solarized'
Plugin 'sjl/badwolf'

" All of the Plugins must be added before the following line
call vundle#end()

"set background=light
"if has("gui_running")
    "colorscheme solarized
"else
"colorscheme molokai
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
set cursorline       " Highlight the current line
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
  autocmd FileType html,css,scss,ruby setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType markdown setlocal wrap linebreak nolist
  autocmd BufNewFile,BufRead *.rss setfiletype xml
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
set colorcolumn=80

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

" Powerline options
set encoding=utf-8
let g:Powerline_symbols = 'fancy'
"let g:Powerline_dividers_override = ['>>', '>', '<<', '<']
let g:Powerline_theme = 'solarized256'

" Disable <CR> for AutoPairs
let g:AutoPairsMapCR = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
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

" Natural Splits
set splitbelow
set splitright

" Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0

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

autocmd BufWritePre *.go,*.py,*.js :call Preserve("%s/\\s\\+$//e")

"au FileType go au BufWritePre <buffer> Fmt

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"let g:go_disable_autoinstall = 1
