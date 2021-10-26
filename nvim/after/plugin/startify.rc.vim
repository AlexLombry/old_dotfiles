
let g:startify_custom_header = [
        \ ' _____/\\\\\\\______________________/\\\\\\\\\_____/\\\\\\__________________         ',
        \ '  ___/\\\/////\\\__________________/\\\\\\\\\\\\\__\////\\\__________________        ',
        \ '   __/\\\____\//\\\________________/\\\/////////\\\____\/\\\__________________       ',
        \ '    _\/\\\_____\/\\\__/\\\____/\\\_\/\\\_______\/\\\____\/\\\_____/\\\____/\\\_      ',
        \ '     _\/\\\_____\/\\\_\///\\\/\\\/__\/\\\\\\\\\\\\\\\____\/\\\____\///\\\/\\\/__     ',
        \ '      _\/\\\_____\/\\\___\///\\\/____\/\\\/////////\\\____\/\\\______\///\\\/____    ',
        \ '       _\//\\\____/\\\_____/\\\/\\\___\/\\\_______\/\\\____\/\\\_______/\\\/\\\___   ',
        \ '        __\///\\\\\\\/____/\\\/\///\\\_\/\\\_______\/\\\__/\\\\\\\\\__/\\\/\///\\\_  ',
        \ '         ____\///////_____\///____\///__\///________\///__\/////////__\///____\///__ ',
        \]
let g:startify_session_dir = '~/.config/nvim/session'

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']                        },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ ]

let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1

let g:webdevicons_enable_startify = 1
let g:startify_commands = [
\   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
\   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
\ ]

let g:startify_bookmarks = [
    \ { 'c': '~/.config/nvim/init.vim' },
    \ { 'g': '~/.gitconfig' },
    \ { 'z': '~/.zshrc' }
\ ]

let g:startify_enable_special = 1

autocmd User Startified setlocal cursorline
nmap <Leader>st :Startify<cr>
