" Modeline {
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker spell:
" }
" Notes {
"
" Originally built from SPF13
" Merged with vim-sensible
" Then with YADR
" Some extra personal modifications
" }
" VIM Mode {
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible  " be iMproved
" }
" Use bundles config {
    if filereadable(expand("~/.vimrc.bundles"))
        source ~/.vimrc.bundles
    endif
" }
" Filetype {
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
" Turn on filetype detection, plugins, and indent
filetype on
filetype indent on
filetype plugin on
" }
" Encoding {
scriptencoding utf-8
set encoding=utf-8
" }
" VIM Folders {

" Persistent undo
set undofile
set undodir=~/.vim/.cache/undo

"" Backups
set backup
set backupdir=~/.vim/.cache/backup

"" Swap files
set swapfile
set directory=~/.vim/.cache/swap

" }

syntax on                   " Syntax highlighting
syntax enable

colorscheme jason

" Settings {

set t_Co=256            " Enable 256 colors to stop the CSApprox warning and make xterm vim shine

" Cursor
set cursorline                  " Highlight current line
set nostartofline     " keep cursor in same column for long-range motion cmds

" Auto
set autowrite                  " automatically write a file when leaving a modified buffer
set autoread                   " Automatically re-read files changed outside of Vim

" Mouse
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing

" Line spacing
set linespace=0                 " No extra spaces between rows

" Wrap
set nowrap                      " Wrap long lines
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set textwidth=80
set linebreak                   " For lines longer than the window,
                                " wrap intelligently. This doesn't
                                " insert hard line breaks.
set showbreak=↪\ \              " string to put before wrapped screen lines

" Tabs
set autoindent                  " Indent at the same level of the previous line
set smartindent
set smarttab              " <TAB> in front of line inserts 'shiftwidth' blanks
set shiftround            " round to 'shiftwidth' for "<<" and ">>"
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set shiftwidth=4
set tabpagemax=15               " Only show 15 tabs

" Scrolling
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set sidescrolloff=2             " min # of columns to keep left/right of cursor

" Folding
set foldenable                  " Auto fold code
set foldcolumn=1

" Line numbers
set number                          " Line numbers on
set numberwidth=4

" Color column
set colorcolumn=+1

" Conceal
set conceallevel=2
set concealcursor=nc

" Spelling
set spell                           " Spell checking on

" Search
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when searching with uppercase
set gdefault                    " For :substitute, use the /g flag by default

" Wild menu
set complete-=i
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

" List
set list
set listchars=tab:›\ ,trail:•,precedes:<,extends:#,nbsp:. " Highlight problematic whitespace

" Buffers
set hidden                          " Allow buffer switching without saving
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" Windows
set winminheight=0              " Windows can be 0 line high

" View
set showmode                    " Display the current mode
set showmatch                   " Show matching brackets/parenthesis
"set matchpairs+=<:>             " Match, to be used with %
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore             " Allow for cursor beyond last character
"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
set history=1000                    " Store a ton of history (default is 20)
set display+=lastline " show last line, even if it doesn't fit in the window

set cmdheight=2 		  " # of lines for the command window
                      " cmdheight=2 helps avoid 'Press ENTER...'
                      " prompts

set nojoinspaces	  	  " Use only one space after '.' when joining
                        " lines, instead of two

"set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize

set tags=./tags;/,~/.vimtags

"set completeopt+=longest 	" better omni-complete menu
  set formatoptions+=j 	" delete comment char on second line when
                        " joining two commented lines
set nrformats-=octal      " don't treat numbers with leading zeros as octal
                          " when incrementing/decrementing
" Link the system clipboard with the unnamed register
set clipboard=unnamed

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Visual selection automatically copied to the clipboard
set go+=a

" Backspace over autoindent, line breaks, start of insert (see :help 'backspace')
set backspace=indent,eol,start

" abbrev. of messages (avoids 'hit enter')
set shortmess+=filmnrxoOtT

set backup                  " Backups are nice ...
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif


if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\                     " Filename
    set statusline+=%w%h%m%r                 " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)

" }

" Mappings {
" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
"let mapleader=","
"let g:mapleader = ","

" Fix command typos (stolen from Adam Katz)
nnoremap ; :

" ` is more useful than ' but less accessible.
nnoremap ' `
nnoremap ` '

" Fast saving
nmap <leader>w :w!<cr>

nmap <leader>c :VimChat <CR>
nmap <leader>t :FriendsTwitter<CR>

nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

nnoremap <silent> <leader>tt :TagbarToggle<CR>

nmap <silent> <leader>s :set nolist!<CR>

" Add mapping for moving between windows with ALT-<arrow keys> "
nmap <silent> <A-Up>    :wincmd k<CR>
nmap <silent> <A-Down>  :wincmd j<CR>
nmap <silent> <A-Left>  :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-y> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" Switching to buffer 1 - 9 is mapped to <Leader> [Buffer number]
for buffer_no in range(1, 9)
  execute "nmap <Leader>" . buffer_no . " :b" . buffer_no . "\<CR>"
endfor

nnoremap <silent> gb :exe('!w3m "'.expand('<cfile>').'"')<CR>

nnoremap <S-U> :GundoToggle<CR>
"nnoremap <S-U> :UndotreeToggle<cr>

inoremap <C-U> <C-G>u<C-U>
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" Make Y consistent with C and D.  See :help Y.
nnoremap Y y$

" }

" Key (re)Mappings {

    " The default leader is '\', but many people prefer ',' as it's in a standard
    " location. To override this behavior and set it back to '\' (or any other
    " character) add the following to your .vimrc.bundles.local file:
    "   let g:spf13_leader='\'
    if !exists('g:spf13_leader')
        let mapleader = ','
    else
        let mapleader=g:spf13_leader
    endif

    " Easier moving in tabs and windows
    " The lines conflict with the default digraph mapping of <C-K>
    " If you prefer that functionality, add let g:spf13_no_easyWindows = 1
    " in your .vimrc.bundles.local file

    if !exists('g:spf13_no_easyWindows')
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_
    endif

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

    " The following two lines conflict with moving to top and
    " bottom of the screen
    " If you prefer that functionality, add the following to your
    " .vimrc.bundles.local file:
    "   let g:spf13_no_fastTabs = 1
    if !exists('g:spf13_no_fastTabs')
        map <S-H> gT
        map <S-L> gt
    endif

    " Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    nnoremap Y y$

    " Code folding options
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " Shortcuts
    " Change Working Directory to that of the current file
    cmap cwd lcd %:p:h
    cmap cd. lcd %:p:h

    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

    " Fix home and end keybindings for screen, particularly on mac
    " - for some reason this fixes the arrow keys too. huh.
    map [F $
    imap [F $
    map [H g0
    imap [H g0

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Adjust viewports to the same size
    map <Leader>= <C-w>=

    " Map <Leader>ff to display all lines with keyword under cursor
    " and ask which one to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    " Easier horizontal scrolling
    map zl zL
    map zh zH

" }
