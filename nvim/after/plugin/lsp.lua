vim.api.nvim_create_user_command('LspRestartVim', function()
    local bufnr = vim.api.nvim_get_current_buf()
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
        vim.lsp.stop_client(client.id)
    end
    vim.defer_fn(function()
        vim.api.nvim_exec_autocmds('FileType', { buffer = bufnr, modeline = false })
    end, 200)
end, { desc = 'Restart LSP clients for the current buffer' })

local servers = {
    tsgo = {},
    pyright = {},
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                rustfmt = {
                    extraArgs = { '+nightly' },
                },
                check = {
                    command = 'clippy',
                },
                cargo = {
                    targetDir = 'target/rust-analyzer',
                    buildScripts = {
                        enable = true,
                    },
                },
                procMacro = {
                    enable = true,
                },
            },
        },
    },
    lua_ls = {
        settings = {
            Lua = {
                workspace = {
                    checkThirdParty = false,
                },
                codeLens = {
                    enable = true,
                },
                completion = {
                    callSnippet = "Replace",
                },
                doc = {
                    privateName = { "^_" },
                },
                hint = {
                    enable = true,
                    setType = false,
                    paramType = true,
                    paramName = "Disable",
                    semicolon = "Disable",
                    arrayIndex = "Disable",
                },
            },
        },
    },
}

for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end

require('trouble').setup {
    modes = {
        custom_diagnostics = {
            mode = 'diagnostics',
            filter = {
                buf = 0,
                function(item)
                    return item.code ~= 'inactive-code'
                end,
            }
        }
    }
}

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local diagnostics = vim.diagnostic.get(0)

        if #diagnostics > 0 then
            require("trouble").open("custom_diagnostics")
        end
    end
})

vim.diagnostic.config({
    virtual_lines = true,
    multiline = true,
    severity_sort = true,
})

vim.keymap.set('n', ']d', function ()
    require('trouble').next()
end, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '[d', function ()
    require('trouble').prev()
end, { desc = 'Go to previous diagnostic' })

vim.keymap.set('n', '<leader>dt', "<cmd>Trouble custom_diagnostics toggle<cr>", {desc='Toggle Trouble'})
vim.keymap.set('n', '<leader>dl', function()
    local current_value = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({virtual_lines = not current_value})
end, { desc = 'Toggle Inline Diagnostics' })
vim.keymap.set('n', '<leader>dk', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle Inline Types' })
vim.keymap.set('n', 'L', vim.diagnostic.open_float, {desc='Diagnostic modal'})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {desc='Documentation modal'})
vim.keymap.set('n', '.', vim.lsp.buf.code_action, {desc='Show code action options'})
