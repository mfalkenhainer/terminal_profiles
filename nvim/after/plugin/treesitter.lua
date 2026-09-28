require('nvim-treesitter').setup {
    install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install {
    'rust',
    'javascript',
    'json',
    'lua',
    'typescript'
}

require('treesitter-context').setup {
    max_lines = 10
}
