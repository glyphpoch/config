call plug#begin('~/.vim/plugged')

if has('nvim')
    " Collection of common configurations for the Nvim LSP client
    Plug 'neovim/nvim-lspconfig'

    " Extensions to built-in LSP, for example, providing type inlay hints
    Plug 'tjdevries/lsp_extensions.nvim'

    " Autocompletion framework for built-in LSP
    Plug 'nvim-lua/completion-nvim'
endif

" Color theme
Plug 'sts10/vim-pink-moon'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Linters
Plug 'dense-analysis/ale'
" {{{
let g:ale_linters_explicit = 1 " only run linters specified in the config file

let g:ale_linters = {
\   'gitcommit': ['gitlint'],
\   'xml': ['xmllint'],
\   'yaml': ['yamllint'],
\   '*': ['proselint'],
\}
" }}}

" Fuzzy finder
Plug 'airblade/vim-rooter'
if has('win32') || has('win64')
    Plug 'junegunn/fzf', { 'dir': 'F:\utilities\bin\', 'do': { -> fzf#install() } }
" else
"     Plug 'junegunn/fzf', { 'dir': '$HOME/.local/bin/', 'do': { -> fzf#install() } }
endif
Plug 'junegunn/fzf.vim'
" {{{
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tabnew'
      \ }
nnoremap <C-P> :FZF<CR>
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END
" }}}

Plug 'rust-lang/rust.vim'

call plug#end()

" Turn off modelines
set modelines=0
set nomodeline

"
" Enable syntax highlighting and file type identification, plugin and indenting
"
syntax enable
filetype plugin indent on

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

if has('nvim')
  " Configure LSP
  " https://github.com/neovim/nvim-lspconfig#rust_analyzer
  lua <<EOF

-- nvim_lsp object
local nvim_lsp = require('lspconfig')

-- function to attach completion when setting up lsp
local on_attach = function(client)
    require('completion').on_attach(client)
end

-- Enable rust_analyzer
nvim_lsp.rust_analyzer.setup({ on_attach=on_attach })

-- Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
EOF

  " Use <Tab> and <S-Tab> to navigate through popup menu
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

  " use <Tab> as trigger keys
  imap <Tab> <Plug>(completion_smart_tab)
  imap <S-Tab> <Plug>(completion_smart_s_tab)

  " Show diagnostic popup on cursor hold
  autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

  " Goto previous/next diagnostic warning/error
  nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
  nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
endif

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

"
" Other custom configuration
"
if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" -----------------
" Color scheme
" -----------------
if has("nvim")
  set termguicolors
  set t_ut=
  colorscheme pink-moon
  hi Normal guibg=None
else
  set termguicolors
  set t_ut=
  colorscheme pink-moon
  hi Normal ctermbg=NONE
  hi nonText ctermbg=NONE
  hi Normal guibg=NONE
endif

" -----------------
" Tab-space
" -----------------
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Other {{{2

set showtabline=2
"set number
set autoread

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Toggle between absolute line numbers when in insert mode and relative line
" numbers when in any other editing mode
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" }}}

" Cursor settings
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" Key mappings {{{2
" Shift + Insert paste
map <S-Insert> "*gP
cmap <S-Insert> <C-R>*
imap <S-Insert> <C-R>*

nnoremap <A-space> g]<CR>
nnoremap <C-space> <C-]>

nnoremap <C-Up> <C-u>
nnoremap <C-Down> <C-d>
nnoremap <C-j> <C-e>
nnoremap <C-k> <C-y>

" Stop suspending nvim with ctrl-z
" map <C-Z> <Nop>
" This can be useful, just resume the vim job with fg

" from http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
if executable('rg')
  set grepprg=rg\ --no-heading\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

" rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
" let g:rust_clip_command = 'xclip -selection clipboard'


" =============================================================================
" # Editor settings
" =============================================================================
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Settings needed for .lvimrc
set exrc
set secure

" Sane splits
set splitright
set splitbelow

" Permanent undo
if has('win32') || has ('win64')
    set undodir=$CUSTOMHOME/.vimdid
else
    set undodir=~/.vimdid
endif
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Enable mouse usage (all modes) in terminals
" set mouse=a
