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
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'tpope/vim-commentary'
Plugin 'chriskempson/base16-vim'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'rking/ag.vim'
Plugin 'skwp/greplace.vim'
Plugin 'keith/swift.vim'
" Plugin 'FredKSchott/CoVim'
Plugin 'ryanoasis/vim-devicons'
" Vundle configuration
call vundle#end()            " required
filetype plugin indent on    " required