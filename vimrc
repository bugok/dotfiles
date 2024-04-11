syntax on
set number
set cursorline

colorscheme desert

" Press returns off highlighting and clear any message already
" displayed.
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" Status bar configuration
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set laststatus=2
set statusline+=%f      "filename
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ [%P]  "percent through file

" Smart case: If you search for something containing uppercase characters, it
" will do a case sensitive search; if you search for something purely
" lowercase, it will do a case insensitive search
" http://stackoverflow.com/a/2288438/1747584
set ignorecase
set smartcase

" Set a column an the 80 character mark
set colorcolumn=80

" Active statusline is gray, non active is black
hi StatusLine term=bold ctermbg=black ctermfg=lightgrey guifg=#c9c9c9 guibg=#2c2c2c
hi StatusLineNC ctermbg=white ctermfg=darkgrey guifg=#585858 guibg=lightgrey

" completions on tab show on a menu (when trying to open files)
" wildmode can be added with 'full', for suggestions. I don't like it.
set wildmode=list,longest
set wildmenu

" set automaric spelling for txt files
" au BufRead *.txt setlocal spell spelllang=en_us
"au BufNewFile,BufRead,BufEnter *.txt setlocal spell spelllang=en_us tw=80 wrap
"au BufNewFile,BufRead,BufEnter *.md setlocal spell spelllang=en_us tw=80 wrap
"au BufNewFile,BufRead,BufEnter /tmp/edit.*/new-commit setlocal spell spelllang=en_us tw=80 wrap
au BufNewFile,BufRead,BufEnter *hg-editor-*.commit.hg.txt setlocal spell spelllang=en_us tw=80 wrap

set expandtab ts=4 sw=4 ai
