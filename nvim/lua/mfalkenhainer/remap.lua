vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Move lines when highlighting
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Page up/down
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Delete without yanking
vim.keymap.set({'n', 'v'}, 'x', '"_x')
vim.keymap.set({'n', 'v'}, 'D', '"_D')
vim.keymap.set({'n', 'v'}, 'C', '"_C')

-- Paste/Yank with clipboard
vim.keymap.set({'n', 'v'}, 'p', '"+p')
vim.keymap.set({'n', 'v'}, 'P', '"+P')
vim.keymap.set({'n', 'v'}, 'y', '"+y')
vim.keymap.set({'n', 'v'}, 'Y', '"+Y')

-- Rename all
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc = 'Rename all'})

-- Go to definition (LSP)
vim.keymap.set('n', 'gd', '<C-]>', { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>gd', '<C-]>', { desc = 'Here'})
vim.keymap.set('n', '<leader>gx', ':split <CR> <C-]>', { desc = 'Horizontal'})
vim.keymap.set('n', '<leader>gv', ':vsplit <CR> <C-]>', { desc = 'Vertical'})

-- Leave Terminal Mode with ESC
vim.keymap.set('t', '<C-Space>', '<C-\\><C-n>', { noremap = true, desc = 'Exit terminal mode' })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-S-K>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-S-J>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-S-H>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-S-L>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Indents
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Tabs
vim.keymap.set('n', '<leader><Tab><Tab>', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
vim.keymap.set('n', '<leader><Tab>n', '<cmd>tabnew<cr>', { desc = 'New Tab' })
vim.keymap.set('n', '<leader><Tab>c', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
vim.keymap.set({'n', 't'}, '<C-e>', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
vim.keymap.set({'n', 't'}, '<C-q>', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })

-- Refresh Nvim
vim.keymap.set('n', '<leader>br', function()
    for name,_ in pairs(package.loaded) do
        if name:match('^cnull') then
            package.loaded[name] = nil
        end
    end

  dofile(vim.env.MYVIMRC)
  dofile(vim.env.NVIM .. "/lua/mfalkenhainer/remap.lua")
end, { desc = 'Refresh Nvim Config' })

-- Move between windows in terminal
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('t', '<C-l>', '<C-Space><C-w>l')
vim.keymap.set('t', '<C-k>', '<C-Space><C-w>k')
vim.keymap.set('t', '<C-j>', '<C-Space><C-w>j')
vim.keymap.set('t', '<C-h>', '<C-Space><C-w>h')

-- Change directory
vim.keymap.set('n', 'cd', ':tcd ', { desc = 'Change Directory' })
