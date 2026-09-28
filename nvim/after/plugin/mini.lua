-- Comment
require('mini.comment').setup {}

vim.keymap.set('v', '<C-/>', 'gc', {remap = true, silent = true})
vim.keymap.set('n', '<C-/>', 'gcc', {remap = true, silent = true})

-- Autopair
require('mini.pairs').setup {}

-- SplitJoin
require('mini.splitjoin').setup {} -- gS -> toggle

-- Surround
require('mini.surround').setup {}
