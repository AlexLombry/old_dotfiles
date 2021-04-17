source $HOME/.config/nvim/plugins/plugins.vim
source $HOME/.config/nvim/plugins/fzf.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/nvcode.vim
source $HOME/.config/nvim/plugins/startify.vim

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

let g:airline_powerline_fonts = 1


let g:webdevicons_enable_airline_statusline = 0
"et g:webdevicons_enable_nerdtree = 1
"let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:webdevicons_enable_airline_tabline = 1

lua require"surround".setup{}