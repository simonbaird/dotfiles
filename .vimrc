
" for pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on
"

syntax on " duh
set background=dark

set t_Co=256 " enable 256 colors


"let g:zenburn_high_Contrast = 1
"colorscheme zenburn
"colorscheme desert
"colorscheme vividchalk
colorscheme ir_black

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
set listchars=tab:»·
"set listchars=tab:»–
"set listchars=tab:»\
"set listchars=tab:·–
"set listchars=tab:·\
"set listchars=tab:\|\
"set list

set number

" no tabs for ruby
au BufNewFile,BufReadPre *.rb set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"---------------------------------------------------------------------------

" make visible tabs less in your face
"hi NonText cterm=NONE ctermfg=darkblue guifg=darkblue
"hi clear SpecialKey
"hi link SpecialKey NonText

" make fold markers less in your face
highlight Folded ctermbg=NONE ctermfg=green
set fillchars=fold:\

" and so on..
"highlight LineNr cterm=NONE ctermfg=black guifg=#333333 guibg=NONE
highlight LineNr cterm=NONE ctermbg=darkblue ctermfg=blue guifg=#333333 guibg=NONE


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

" highlight spaces at start of line and tabs later (because you don't generally want those)
" tab space star is allowed for docblocks
" (red version)
"(underline version)
"autocmd BufWinEnter * match  Underlined /[^\t]\zs\t\+\|\s\+$/
"autocmd BufWinEnter * 2match Underlined /^\t*\zs \+\ze[^*]/


"set statusline=%-50.50F\ %2*[Format:\ %{&ff}]%*\ %2*[Type:\ %-6Y]%*\ %2*[ASCII:\ \%4.3b]%*\ %2*[HEX:\ \%02.2B]%*\ %4*(%4l,%4v)%*\ %6*%3p%%\ \ of\ %4L\ lines%*\ %1*%3m%4r%6h%*
"set laststatus=2

" The strings "%N*" unto "%*" correspond to the highlight group "UserN":
hi  User1   term=reverse    cterm=reverse   ctermfg=red     ctermbg=NONE    guifg=lightred      guibg=NONE  gui=reverse,bold
hi  User2   term=reverse    cterm=reverse   ctermfg=green   ctermbg=NONE    guifg=lightgreen    guibg=NONE  gui=reverse,bold
hi  User3   term=reverse    cterm=reverse   ctermfg=blue    ctermbg=NONE    guifg=lightblue     guibg=NONE  gui=reverse,bold
hi  User4   term=reverse    cterm=reverse   ctermfg=yellow  ctermbg=NONE    guifg=lightyellow   guibg=NONE  gui=reverse,bold
hi  User5   term=reverse    cterm=reverse   ctermfg=magenta ctermbg=NONE    guifg=lightmagenta  guibg=NONE  gui=reverse,bold
hi  User6   term=reverse    cterm=reverse   ctermfg=cyan    ctermbg=NONE    guifg=lightcyan     guibg=NONE  gui=reverse,bold


map <C-C>t :!make tags<CR>:set tags=TAGS<CR>

"set foldopen=all



set guioptions-=T                     " Hide gvim toolbar
set guioptions+=br                    " Add bottom and right scrollbars
set guifont=DejaVu\ Sans\ Mono:h14.00 " Set gvim font

set directory=~/.vimfiles
set backupdir=~/.vimfiles
