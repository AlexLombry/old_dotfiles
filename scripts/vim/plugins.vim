filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'chriskempson/base16-vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'janko/vim-test'
Plugin 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plugin 'lifepillar/vim-solarized8'
Plugin 'dense-analysis/ale'
" Use release branch (Recommend)
" Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" Vundle configuration
call vundle#end()            " required
filetype plugin indent on    " required
