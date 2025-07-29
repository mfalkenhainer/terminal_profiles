-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Move Lines
map("n", "<C-S-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<C-S-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<C-S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<C-S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<C-S-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<C-S-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

map("n", "<C-1>", ":NvimTreeToggle<CR>")

map("n", "<C-[>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-]>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "f", "w", { remap = true })
map("n", "<A-h>", "b", { remap = true })
map("n", "<A-l>", "w", { remap = true })
map("n", "<A-j>", "j", { remap = true })
map("n", "<A-k>", "k", { remap = true })

-- Initialize completion as disabled by default
if vim.b.completion == nil then
  vim.b.completion = false
end

-- Override LazyVim's default animation toggle with blink autocomplete toggle
map("n", "<leader>uq", function()
  -- Hide the completion menu if it's currently open
  local blink_ok, blink = pcall(require, "blink.cmp")
  if blink_ok then
    blink.hide()
  end

  -- Toggle the buffer-local completion state
  vim.b.completion = not vim.b.completion

  local status = vim.b.completion and "enabled" or "disabled"
  vim.notify("Blink autocomplete " .. status, vim.log.levels.INFO)
end, { desc = "Toggle autocomplete" })
