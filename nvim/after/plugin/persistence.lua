require('persistence').setup {}

-- select a session to load
vim.keymap.set("n", "<leader>qs", function() require("persistence").select() end, { desc = 'Select a session' })

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = 'Load last session' })

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = 'Stop persistence' })
