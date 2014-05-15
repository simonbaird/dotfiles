"-------------------------------------------------------------------------------
" Setup Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

"-------------------------------------------------------------------------------
" Plugins
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'scrooloose/nerdtree'

Bundle 'tpope/vim-fugitive'
"Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-rails'
Bundle 'mileszs/ack.vim'

Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'vim-scripts/Align'

Bundle 'plasticboy/vim-markdown'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'groenewege/vim-less'
"Bundle 'derekwyatt/vim-scala'

Bundle 'twerth/ir_black'
Bundle 'nanotech/jellybeans.vim'

"-------------------------------------------------------------------------------
" Some basics

set nocp              " don't compatible
set nohls             " don't highlight search
set nowrap            " don't wrap
set visualbell        " don't beep
" don't flash either
set t_vb=
set ai                " auto indent
set hidden            " buffer can be backgrounded without writing (?)
set nojoinspaces      " don't want two spaces after a full stop

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

set encoding=utf-8
set fileencoding=utf-8

"set showtabline=2     " always show tabs (the window kind)
"set showtabline=0     " trying to wean off tabs and on to buffers
set number            " show line numbers

set virtualedit=block " cursor can go past line end in block moade

" Default leader is backslash. Let's use comma instead.
let mapleader = ","

" Type commands without needing shift key
" (Though my fingers haven't learned to use it yet...)
map ; :

" Detect the file but use my rules for indenting (?)
filetype on
filetype indent off

" Swap these jump to marker commands because ' is slightly more useful or whatever
nnoremap ' `
nnoremap ` '

" Remember more history
set history=1000

" Enable extended matching with % (shrug)
runtime macros/matchit.vim

" Pressing tab on command line shows all options
set wildmenu
set wildmode=list:longest

" If cursor moves to bottom of screen bump up 3 lines
set scrolloff=3

" Always show a status line
set laststatus=2

" Show line number and percent in status line
set ruler

" Smoother display apparently
set ttyfast

" Remember undos between sessions
if version > 730
  set undofile
  set undodir=~/.vimfiles
endif

" Not sure...
set showmode
set showcmd

"-------------------------------------------------------------------------------
" Search

set nohlsearch " don't highlight


"-------------------------------------------------------------------------------
" Colours

set t_Co=256         " enable 256 colors
syntax on
set background=dark

let g:zenburn_high_Contrast = 1

"silent! colorscheme ir_black
silent! colorscheme jellybeans

"set directory=~/tmp

"-------------------------------------------------------------------------------
" Colour Tweaks

" Make visible tabs less in your face
hi NonText cterm=NONE ctermfg=darkblue guifg=#444444
hi clear SpecialKey
hi link SpecialKey NonText

" Make fold markers less in your face
highlight Folded ctermbg=NONE ctermfg=green guibg=#000000 guifg=#313633
set fillchars=fold:\

" Make line numbers less in your face
highlight LineNr cterm=NONE ctermbg=NONE ctermfg=black guifg=#313633 guibg=#111111

"-------------------------------------------------------------------------------
" Gui Stuff

if has("gui_running")
  "set guifont=DejaVu\ Sans\ Mono:h14.00
  "set guifont=Menlo\ Regular:h14
  "set guifont=Monaco\ 10
  "set guifont=Monospace\ 12
  "set guifont=Liberation\ Mono\ Bold\ 12
  "set guifont=Liberation\ Mono\ 11
  "set guifont=String\ Literal\ Medium\ 9
  "set guifont=Inconsolata\ Medium\ 14
  "set guifont=Droid\ Sans\ Mono\ 11
  set guifont=Source\ Code\ Pro\ 12

  set guioptions-=T " No toolbar
  set guioptions-=m " No menu
  set guioptions+=a " Auto copy selected areas for pasting (?)

  " no scroll bars
  set guioptions-=R
  set guioptions-=r
  set guioptions-=L
  set guioptions-=l
  set guioptions-=b

  " Increase/decrease font size
  nmap <C-M-J> :let &guifont = substitute(&guifont, '\(\d\+\)$', '\=(submatch(1) - 1)', '')<CR>
  nmap <C-M-K> :let &guifont = substitute(&guifont, '\(\d\+\)$', '\=(submatch(1) + 1)', '')<CR>

" To go fullscreen on startup:
"  set fuoptions=maxvert,maxhorz
"  au GUIEnter * set fullscreen

  "set columns=160 lines=57
  "

  " Copy and Paste!

  " Like in a terminal
  "map  <S-C-v> "+p
  "imap <S-C-v> "+pa
  "map  <S-C-c> "+y

  " Cmd-C, Cmd-P in case I've been using the mac recently
  map  <M-v> "+p
  imap <M-v> "+pa
  map  <M-c> "+y


endif

"-------------------------------------------------------------------------------
" Tabs
"set tabstop=4 softtabstop=4 shiftwidth=4
set tabstop=2 softtabstop=2 shiftwidth=2 et

"set listchars=tab:»·
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ 
set list

" no tabs for ruby
au BufNewFile,BufReadPre *.rb,*.erb set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" ryan likes four spaces so let's place nice
au BufNewFile,BufReadPre *.scss set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" python
au BufNewFile,BufReadPre *.py,pooltool,leaderboard set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" no tabs for .dot
au BufNewFile,BufReadPre *.dot set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" perl (with sw=4 and hard tabs=8)
"au BufNewFile,BufReadPre *.pl set tabstop=8 softtabstop=8 shiftwidth=4 noexpandtab nolist
au BufNewFile,BufReadPre *.pl set tabstop=4 softtabstop=4 shiftwidth=4 expandtab nolist

" markdown, want to have four space soft tabs and want to wrap when typing
au BufNewFile,BufReadPre *.markdown,*.md set tabstop=4 softtabstop=4 shiftwidth=4 expandtab list tw=78
au BufRead *.markdown,*.md set filetype=mkd

" git config
au BufNewFile,BufReadPre .gitconfig,*.git/config set tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab nolist

" java
au BufNewFile,BufReadPre *.java set tabstop=4 softtabstop=4 shiftwidth=4 expandtab list

" commit messages
au BufRead COMMIT_EDITMSG set tw=68

"-------------------------------------------------------------------------------
" Gonna try some folding... Nah.
" au BufNewFile,BufReadPre *.rb set foldmethod=indent foldlevel=1

" Markdown plugin wants to start folded. Disable that.
let g:vim_markdown_folding_disabled=1

"-------------------------------------------------------------------------------
" Some handy mappings

" word wrap a paragraph
map Q {gq}

" make a word upper case
map B ebgUew

" Save when alt-tabbing away (experimental)
"au FocusLost * :wa

" Run this file as a ruby test
" (Can also do :Rake from vim-rails plugin but it takes ages
" because it init the test database etc)
map <Leader>r :w<CR>:!NO_FIXTURE_LOAD=1 NO_REDGREEN=1 ruby -Ilib:test %<CR>

" Reselect visual block after indent/unindent
"vnoremap < <gv
"vnoremap > >gv

" That thing where you forget to sudo. doesn't work in gvim :(
cmap w!! %!sudo tee > /dev/null %

"-------------------------------------------------------------------------------
" For indent-guides plugin
let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 4

" Kind of a nice blue and green, designed for ir_black
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#222222 ctermbg=none
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#181818 ctermbg=none

let g:indent_guides_enable_on_vim_startup = 1


"-------------------------------------------------------------------------------
" Plugins

map <Leader>o :NERDTreeToggle<CR>
map <C-O> :NERDTreeToggle<CR>

" Used to use Command-T (actually shift-T so that's why...)
let g:ctrlp_map = '<S-T>'
let g:ctrlp_cmd = 'CtrlPMixed'

map <S-L> :BufExplorer<CR>

map <Leader>n :bnext<CR>
map <Leader>p :bprev<CR>
map <Leader>, <C-^>

" shift-f does that clash with anything important?
"map <Leader>F :Ack 
"map <S-F> :Ack 
map <Leader>F :Ggrep 
map <S-F> :Ggrep 

" ConqueTerm
let g:ConqueTerm_Syntax = 'ruby'

"-------------------------------------------------------------------------------
" Must kill trailing space...

" 1. Highlight trailing whitespace in red
" 2. Have this highlighting not appear whilst you are typing in insert mode
" 3. Have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace ctermbg=darkred guibg=#440000
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter,BufRead,BufNewFile,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

" Kill all trailing whitespace now
map <Leader>s :%s/\s\+$//<CR>

"-------------------------------------------------------------------------------
" Hall of usefulness past

" kill fASTCGI
"map <F8> :wa<CR> :!/opt/bin/dev_restart.pl<CR><CR>
"map! <F8> :wa<CR> :!/opt/bin/dev_restart.pl<CR><CR>

" Write all and make
"map <F8> :wa<CR> :!make clean;make<CR>
"map! <F8> :wa<CR> :!make clean;make<CR>

" Run unit test on this file
"map <C-C>r :!phpunit %<CR>

" Control-C p when you want to copy/paste without line numbers and visible tabs
"map <Leader>p :set invnumber invlist<CR>
"map <Leader>p :set invnumber<CR>

" Use nasm syntax highlighting
"au BufNewFile,BufReadPre *.asm let b:asmsyntax='nasm'
"au BufNewFile,BufReadPre *.inc let b:asmsyntax='nasm'

" make it use php syntax highlighting for phtml
"au BufRead *.phtml set filetype=php

" for our perlish templates (doesn't get in the way of vanilla html too much)
"augroup filetypedetect
"autocmd! BufNewFile,BufRead *.html setf embperl
"augroup END

" this stops long pods in perl from confusing syntax highlighter
"syn sync fromstart " just doo it
"syn sync minlines=1000 " if it gets slow

" Add comment above
"map <C-C>c O/*<CR> * <CR>*/<ESC>kA

" Add a docblock comment above
"map <C-C><C-C> O/**<CR> * <CR>*/<ESC>kA
