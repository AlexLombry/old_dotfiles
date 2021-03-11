source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/plugins/fzf.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/nvcode.vim

lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

"Automatically source the Vimrc file on save.
augroup autosourcing
    autocmd!
    autocmd BufWritePost init.vim source %
augroup END

"-------------NERDTree Configurations--------------"
nmap <C-b> :NERDTreeToggle<cr>
let g:NERDTreeDirArrowExpandable="+"
let NERDTreeHijackNetrw = 0
let g:NERDTreeDirArrowCollapsible="~"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1

if executable('rg')
    let g:rg_derive_root='true'
endif
