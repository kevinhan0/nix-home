''
  set number
  set nowrap
  set hidden
  set ttyfast
  set mouse=a
  set nobackup
  syntax enable
  set expandtab
  set tabstop=4
  set noswapfile
  set lazyredraw
  set noshowmode
  set cursorline
  set cmdheight=2
  set shiftwidth=4
  set shortmess+=c
  set softtabstop=4
  set nowritebackup
  set relativenumber
  set signcolumn=yes
  filetype plugin on
  set updatetime=300
  set termguicolors
  set clipboard=unnamedplus
  set guicursor=n-v-c-sm:ver25-blinkon0,i-ci-ve:ver25,r-cr-o:hor20

  " colorscheme
  packadd! onedark
  colorscheme onedark
  " colorscheme wal

  " indentLine
  let g:indentLine_first_char = '┊'
  let g:indentLine_char = '┊'
  let g:indentLine_showFirstIndentLevel = 1

  " vim-airline
  let g:airline_theme='onedark'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#bufferline#enabled = 1

  " nerdtree
  let NERDTreeShowHidden = 1
  let NERDTreeMinimalUI = 1
  let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git$']
  let g:NERDTreeDirArrowExpandable = ' '
  let g:NERDTreeDirArrowCollapsible = ' '
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

  " nerdcommenter
  let g:NERDSpaceDelims = 1
  nnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>
  inoremap <C-_> <esc>:call NERDComment('Toggle', 'Toggle')<CR>
  vnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>gv

  " Python syntax
  au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

  " Markdown auto-wrap
  au BufNewFile,BufRead *.md set wrap | set tw=80 | set spell

  " Bindings
  let mapleader='z'
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
  nnoremap <Leader>nn : NERDTreeToggle<cr>
  nnoremap <Leader>g : Goyo<cr>
  nnoremap <Leader>gg : Goyo!<cr>
  nnoremap <Leader>l : Limelight<cr>
  nnoremap <Leader>ll : Limelight!<cr>

  " LaTeX
  let g:tex_flavor='latex'
  " let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'

  " vim-markdown
  let g:vim_markdown_math = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal = 1

  " Kite
  let g:kite_tab_complete=1
  set completeopt-=preview
  set completeopt+=menuone
  set completeopt+=noinsert
  set completeopt-=longest

  " Black
  let g:black_virtualenv = "~/.vim_black"
  autocmd BufWritePre *.py execute ':Black'

  " Limelight
  let g:limelight_conceal_ctermfg = 'DarkGray'

  " Goyo
  autocmd! User GoyoEnter Limelight
  autocmd! User GoyoLeave Limelight!

  " tslime
  vmap <Leader><Enter> <Plug>SendSelectionToTmux
  let g:tslime_always_current_session = 1
  let g:tslime_always_current_window = 1

  " vimpyter
  autocmd Filetype ipynb nmap <silent><Leader>b :VimpyterInsertPythonBlock<CR>
  autocmd Filetype ipynb nmap <silent><Leader>j :VimpyterStartJupyter<CR>

  " vimwiki
  let g:vimwiki_list = [{'path': '~/Projects/vimwiki/',
                        \'syntax': 'markdown', 'ext': '.md'}]

  " coc
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction
 
  inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
''
