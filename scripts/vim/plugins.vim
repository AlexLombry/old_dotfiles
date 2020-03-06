filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dikiaap/minimalist'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Linting
Plugin 'neomake/neomake'
Plugin 'w0rp/ale'

" PHP-specific integration
Plugin 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plugin 'ncm2/ncm2'
Plugin 'roxma/nvim-yarp'
Plugin 'phpactor/ncm2-phpactor'

" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Comments
Plugin 'tpope/vim-commentary'

" Search
Plugin 'ctrlpvim/ctrlp.vim'

" Syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'matthewbdaly/vim-filetype-settings'

Plugin 'chriskempson/base16-vim'

" Vundle configuration
call vundle#end()            " required
filetype plugin indent on    " required
