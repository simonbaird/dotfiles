
set fileencoding=utf-8

" for pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
"

syntax on " duh
set background=dark

"set t_Co=256 " enable 256 colors


"let g:zenburn_high_Contrast = 1
"colorscheme zenburn
"colorscheme desert
"colorscheme vividchalk
colorscheme ir_black
"colorscheme vilight


"colorscheme koehler

set t_Co=256 "enable 256 colors

"colorscheme desert256 "set colorscheme to desert256
syntax enable "turn on syntax highlighting


set modelines=100000
set nocp
set nohls
set nowrap
set showtabline=2
set visualbell t_vb=

" write all and make
"map <F8> :wa<CR> :!make clean;make<CR>
"map! <F8> :wa<CR> :!make clean;make<CR>

"
noremap <C-F8> :phptest %<CR>

" Control-C p when you want to copy/paste without line numbers and visible tabs
"map <C-C>p :set invnumber invlist<CR>
map <C-C>p :set invnumber<CR>

" Control-S saves
"map <C-s>:w<CR>
" Control-S saves
"map <C-w>:w<CR>

" kill fASTCGI
"map <F8> :wa<CR> :!/opt/bin/dev_restart.pl<CR><CR>
"map! <F8> :wa<CR> :!/opt/bin/dev_restart.pl<CR><CR>

" make it use nasm syntax highlighting
au BufNewFile,BufReadPre *.asm let b:asmsyntax='nasm'
au BufNewFile,BufReadPre *.inc let b:asmsyntax='nasm'

" make it use php syntax highlighting for phtml??
au BufRead *.phtml set filetype=php



"---------------------------------------------------------------------------

" shift tab and shift-t for tabs
map <S-Tab> gt
map <S-T> :tabnew<CR>:e<Space>

map <Tab> <C-W><C-W>


"---------------------------------------------------------------------------

set tabstop=4
set softtabstop=4
set shiftwidth=4
"set et
"
""ascii-183==·
""ascii-187==»
"set listchars=tab:»·
"set listchars=tab:»–
"set listchars=tab:»\
"set listchars=tab:·–
"set listchars=tab:·\ 
set listchars=tab:»\ 
"set listchars=tab:\|\
set list

set number

" no tabs for ruby
au BufNewFile,BufReadPre *.rb set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" no tabs for .dot
au BufNewFile,BufReadPre *.dot set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"---------------------------------------------------------------------------

" make visible tabs less in your face
hi NonText cterm=NONE ctermfg=darkblue guifg=#222222
hi clear SpecialKey
hi link SpecialKey NonText

" make fold markers less in your face
highlight Folded ctermbg=NONE ctermfg=green
set fillchars=fold:\

" and so on..
"highlight LineNr cterm=NONE ctermfg=grey guifg=#777777 guibg=NONE
highlight LineNr cterm=NONE ctermbg=darkblue ctermfg=blue guifg=#333333 guibg=NONE
highlight LineNr cterm=NONE ctermbg=darkblue ctermfg=blue guifg=#222222 guibg=#111111


"---------------------------------------------------------------------------

" for our perlish templates (doesn't get in the way of vanilla html too much)
augroup filetypedetect
autocmd! BufNewFile,BufRead *.html setf embperl
augroup END

" this stops long pods in perl from confusing syntax highlighter
syn sync fromstart " just doo it
"syn sync minlines=1000 " if it gets slow


"---------------------------------------------------------------------------

" word wrap a paragraph
map Q {gq}

" make a word upper case
map B ebgUew


" auto indent
set ai

" Add comment above
map <C-C>c O/*<CR> * <CR>*/<ESC>kA

" Add a docblock comment above
map <C-C><C-C> O/**<CR> * <CR>*/<ESC>kA

" Run unit test on this file
map <C-C>r :!phpunit %<CR>

" Nerd tree
map <C-O> :NERDTreeToggle<CR>

" 1. highlight trailing whitespace in red
" 2. have this highlighting not appear whilst you are typing in insert mode
" 3. have the highlighting of whitespace apply when you open new buffers
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter,BufRead,BufNewFile,InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/

"set statusline=%-50.50F\ %2*[Format:\ %{&ff}]%*\ %2*[Type:\ %-6Y]%*\ %2*[ASCII:\ \%4.3b]%*\ %2*[HEX:\ \%02.2B]%*\ %4*(%4l,%4v)%*\ %6*%3p%%\ \ of\ %4L\ lines%*\ %1*%3m%4r%6h%*
"set laststatus=2

map <C-C>t :!make tags<CR>:set tags=TAGS<CR>

"set foldopen=all

set guioptions-=T                     " Hide gvim toolbar
"set guioptions+=br                    " Add bottom and right scrollbars
set guifont=DejaVu\ Sans\ Mono:h14.00 " Set gvim font

set directory=~/.vimfiles
set backupdir=~/.vimfiles

