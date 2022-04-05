autocmd BufWritePre * :%s/\s\+$//ge
let mapleader = "\<Space>"

set clipboard=unnamed
colorscheme delek

" Indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set fileencodings=utf-8,sjis,shift_jis,iso-2022-jp,euc-jp,cp932,ucs-bom

" Search
set ignorecase
set smartcase
set wrapscan
set incsearch
set inccommand=split

" Dein.vim
let s:dein_dir = expand("~/.local/share/dein")
let s:dein_repo = s:dein_dir . "/repos/github.com/Shougo/dein.vim"

if &runtimepath !~# "/dein.vim"
  if !isdirectory(s:dein_repo)
    execute "!git clone https://github.com/Shougo/dein.vim" s:dein_repo
  endif
  execute "set runtimepath^=" . fnamemodify(s:dein_repo, ":p")
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let g:rc_dir = expand("~/.config/nvim")
  let s:toml = g:rc_dir . "/dein.toml"
  let g:dein#auto_recache = 1
  call dein#load_toml(s:toml, {"lazy": 0})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
