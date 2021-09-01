" ## General Settings -----------------------------------------

" Add FZF to runtime path
set rtp+=/usr/local/opt/fzf

" Use vim defaults
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" Setting mapleader
let mapleader = " "

" Indenting
:set shiftwidth=2
:set autoindent
:set smartindent
:set smarttab

" Folding
:set foldmethod=indent
:set foldnestmax=20
:set foldlevel=99

" Perf
:set complete-=i " Limit files searched for autocomplete

" Configure Lines
:set nu rnu
:set cursorline

" Configure Cursors 
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Configure ctags
set tags=./tags;,tags; " Look up tree for tags file

" Recursive tab completion when finding files
set path+=**

" Mappings
:map Y y$

" ## Netrw Configraution -----------------------------------------

" Allow netrw to remove non-empty local directories
let g:netrw_rmdir_cmd='rm -r'

" ## File Configuration -----------------------------------------

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

" ## Vundle Configuration -----------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-speeddating'
Plug 'airblade/vim-gitgutter'
Plug 'vim-test/vim-test'
Plug 'tpope/vim-obsession'
Plug 'psliwka/vim-smoothie'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

" Snippets
Plug 'SirVer/ultisnips' " Snip Engine
Plug 'honza/vim-snippets' " Snippet library
Plug 'joaohkfaria/vim-jest-snippets'

call plug#end()

" ## Settings for Installed Plugins -----------------------------------------

" dense-analysis/ale Settings
let g:ale_fix_on_save = 1 " Set this variable to 1 to fix files when you save them.
let g:ale_completion_enabled = 1

let g:ale_sign_error = '>'
let g:ale_sign_warning = '-'

" junegunn/fzf.vim Settings
let $FZF_DEFAULT_COMMAND = 'ag -g ""'

nnoremap <silent> <Leader><Space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>s :Snippets<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn 

nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction

" AgIn: Start ag in the specified directory
"
" e.g.
"   :AgIn .. foo
function! s:ag_in(bang, ...)
  if !isdirectory(a:1)
    throw 'not a valid directory: ' .. a:1
  endif
  " Press `?' to enable preview window.
  call fzf#vim#ag(join(a:000[1:], ' '), fzf#vim#with_preview({'dir': a:1}, 'up:50%:hidden', '?'), a:bang)

  " If you don't want preview option, use this
 " call fzf#vim#ag(join(a:000[1:], ' '), {'dir': a:1}, a:bang)
endfunction

command! -bang -nargs=+ -complete=dir AgIn call s:ag_in(<bang>0, <f-args>)

" tpope/vim-fugitive Settings
nmap <leader>gs :G<CR>
nmap <leader>gj :diffGet //3<CR>
nmap <leader>gh :diffGet //2<CR>

" arcticicestudio/nord-vim Settings
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme nord

" Plug 'vim-airline/vim-airline'
let g:airline_section_x = ''
let g:airline_section_y = ''

" Plug 'airblade/vim-gitgutter'
set updatetime=100
