"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => dense-analysis/ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_fix_on_save = 1 
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
let g:ale_completion_max_suggestions = 40

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:ale_go_bingo_executable = 'gopls'
let g:ale_linters = {
  \ 'go': ['gopls'],
  \}

nmap <Leader>ad <Plug>(ale_go_to_definition)
nmap <Leader>asd <Plug>(ale_go_to_definition_in_split)
nmap <Leader>avd <Plug>(ale_go_to_definition_in_vsplit)
nmap <Leader>ar <Plug>(ale_find_references)
nmap <Leader>ah <Plug>(ale_hover)
nmap <Leader>ai <Plug>(ale_import)
nmap <Leader>aj <Plug>(ale_next)
nmap <Leader>ak <Plug>(ale_previous)
