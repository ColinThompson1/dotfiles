"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
set rtp+=/opt/homebrew/opt/fzf

let $FZF_DEFAULT_COMMAND = 'ag --hidden -g ""'

nnoremap <silent> <Leader><Space> :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>B :Windows<CR>
" nnoremap <silent> <leader>; :BLines<CR>
" nnoremap <silent> <leader>o :BTags<CR>
" nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
" nnoremap <silent> <leader>s :Snippets<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn 

nnoremap <silent> <leader>K :call SearchWordWithAg()<CR>
vnoremap <silent> <leader>K :call SearchVisualSelectionWithAg()<CR>
nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

" Replace ctrl-x with ctrl-s
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

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


  " Default options are --nogroup --column --color
  let s:ag_options = ' --one-device --skip-vcs-ignores --smart-case --file-search-regex spec'

  command! -bang -nargs=* NoTest
        \ call fzf#vim#ag(
        \   <q-args>,
        \   s:ag_options,
        \  <bang>0 ? fzf#vim#with_preview('up:60%')
        \        : fzf#vim#with_preview('right:50%:hidden', '?'),
        \   <bang>0
        \ )


  nnoremap <leader>af :ALEFindReferences -quickfix<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Merging shortcuts
nmap <leader>gs :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => joshdick/onedark.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup colour scheme 
colorscheme onedark

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline/vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Customize layout
let g:airline_section_x = ''
let g:airline_section_y = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airblade/vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make updates more responsive

set updatetime=100


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bkad/camelcasemotion

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> ,w <Plug>CamelCaseMotion_w
map <silent> ,b <Plug>CamelCaseMotion_b
map <silent> ,e <Plug>CamelCaseMotion_e


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => github/copilot

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" imap <silent><script><expr> <C-n> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true


