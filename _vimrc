" Use Vim not Vi compatibility
set nocompatible

" Auto Reload VIMRC File
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }


" Vim Plug Section
call plug#begin('~/vimfiles/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'reewr/vim-monokai-phoenix'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/dbext.vim'
Plug 'vimwiki/vimwiki'
"Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'

call plug#end()


" Remove that annoying bell!
"set visualbell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"let g:gruvbox_color_column='red'
colorscheme monokai-phoenix

" Set the Column Color
set colorcolumn=80
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)


" This loads the filetype specific indent file if it exists
"if has("autocmd")
filetype plugin indent on
"endif
syntax on

" set omnifunc=syntaxcomplete#Complete

" Set MD file extension to markdown not Modula
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown,*.mkd setlocal filetype=markdown
    let g:markdown_fenced_languages = ['sql', 'css', 'javascript', 'js=javascript', 'json=javascript', 'xml', 'html']
augroup END

" GUI specific settings
if has("gui_running")
    " Set GUI font
    set guifont=Consolas:h12:cANSI
    highlight ColorColumn guibg=#ff8a05
    " Function to control GUI look
    function! ToggleGUICruft()
        if &guioptions=='i'
            exec('set guioptions=imTrL')
        else
            exec('set guioptions=i')
        endif
    endfunction
    map <F11> <Esc>:call ToggleGUICruft()<cr>

    " by default, hide gui menus
    set guioptions=i

    au GUIEnter * simalt ~x
endif

if has("win32")
    " Set Starting Directory
    cd C:\Users\dbornt

    " VimWiki Settings
    let wiki_1 = {}
    let wiki_1.path = '~\Dropbox\vimwiki\'
    let wiki_1.index = 'index'
    let wiki_1.ext = '.wiki'
    "let wiki_1.syntax = 'markdown'
    "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
else
    " Set Starting Diretory
    cd ~

    let wiki_1 = {}
    let wiki_1.path = '~/Dropbox/vimwiki/'
    let wiki_1.index = 'index'
    let wiki_1.ext = '.wiki'
    "let wiki_1.syntax = 'markdown'
endif

" Global Vimwiki settings
 let g:vimwiki_list = [wiki_1]
 let g:vimwiki_use_calendar = 1
 let wiki_1.nested_syntaxes = {'py': 'python', 'c++': 'cpp', 'sql': 'SQL', 'html': 'html'}
 " let wiki_2.nested_syntaxes = {'py': 'python', 'c++': 'cpp', 'sql': 'SQL', 'html': 'html'}


" Set TODO file extension syntax
augroup todo
    au!
    au BufNewFile,BufRead *.todo setlocal filetype=todo.txt
augroup END

" Set SQL file extension syntax 
augroup sql
    au!
    au BufNewFile,BufRead *.sql setlocal filetype=sql
augroup END

autocmd FileType sql setlocal tabstop=3 softtabstop=3 shiftwidth=3 shiftround noexpandtab

let g:pymode_python =  0 " 'python3'

" Make Buffers Hidden
set hidden

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Some Sane Mappings
" Map leader to Space
let mapleader=","

" Map local leader to backslash
let localleader="\\"

" Map Escape to jk
inoremap jk <Esc>

" Map semi-colon to colon for ease of command use
nnoremap ; :

" Remap y$ (yank to end) to Y like D etc...
nnoremap Y y$

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" ???
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" Map Escape key to escape with highlight off
nnoremap <esc> :noh<return><esc>

" Map to insert 'x' at the beginning of the line
nnoremap  <leader>d 0ix<space><esc><cr>

" Set the fold method
set foldmethod=syntax
set nofoldenable

" Map collapse current fold to space bar
nnoremap <space> za

" Map CTRL-A to select all
nnoremap <C-a> gg<S-v><S-g>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Easy new tab key binding
nnoremap <leader>t :tabnew<cr>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

" Map NERDTreeToggle to F3 key
vnoremap <F3> <esc>:NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeToggle<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Map ddq to open Data Quality folder 
nnoremap ddq :e Y:\Global\ Data\ Goverance\Data\ Quality

" Creates markdown header when # is pressed on a line
noremap # :call MdHeader1()<cr>

" Opens my Snippet file
noremap <leader>sn = :call Snip()<cr>

" Call MRU from mm
nnoremap mm :MRU

" Useful settings
set history=700
set undolevels=700

" Make Backspace work like normal (wrap backwards)
set bs=2

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Showing line numbers and length
set relativenumber " Enable relative number
set number  " show line numbers
set tw=0   " width of document (used by gd)
set wrapmargin=0 
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing


" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
set pastetoggle=<F2>
set clipboard=unnamed

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Status Line Setup
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] 
set laststatus=2

" MRU Settings
let MRU_Use_Current_Window = 1
let MRU_Max_Entries = 1000

" DBext Connection Profiles
let g:dbext_default_profile_xxrptg = 'type=ORA:srvname=EBS1PD:user=xxrptg:passwd=Ego8PobO'
let g:dbext_default_profile = 'xxrptg' 

" Special Diff Function
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  n let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Miscellaneous Functions
function! MdHeader1()
    exec(':0i#<Esc>')
endfunction

function! Snip()
    exec(':e Dropbox/snippets')
endfunction

function! Vtd()
    exec('VWS /\[\s\]/')
    exec('lopen')
endfunction

" CtrlP Setup
" Set no max file limit
"let g:ctrlp_max_files = 0
" Search from current directory instead of project root
"let g:ctrlp_working_path_mode = 0
"noremap <C-s> :CtrlP
