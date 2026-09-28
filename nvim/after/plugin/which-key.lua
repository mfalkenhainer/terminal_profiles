local wk = require('which-key')

wk.setup {
    preset = 'helix'
}

wk.add {
    {'<leader>d', group = 'Diagnostics'},
    {'<leader>f', group = 'File/find'},
    {'<leader>g', group = 'Go to / Git'},
    {'<leader>gr', group = 'Code Actions'},
    {'<leader>q', group = 'Sessions'},
    {'<leader>t', group = 'Terminal'}
}
