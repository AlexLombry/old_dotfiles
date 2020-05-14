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
" Plugin 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plugin 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
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

" Looking
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Autoload ctags
Plugin 'ludovicchabant/vim-gutentags'

" Show variables on a tab
Plugin 'majutsushi/tagbar'

" Fancy start screen
Plugin 'mhinz/vim-startify'

" Better Json Syntax Highlighting
Plugin 'elzr/vim-json', { 'for': 'json' }

" Syntax for Dockerfile
Plugin 'ekalinin/Dockerfile.vim'

" Vundle configuration
call vundle#end()            " required
filetype plugin indent on    " required
