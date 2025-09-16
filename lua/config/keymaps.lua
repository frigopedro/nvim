-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
vim.opt.scrolloff = 8
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.clipboard = "unnamedplus"
-- Replace current line
vim.keymap.set("n", "<leader>r", ":s///g<Left><Left><Left>", { desc = "Replace in line" })

-- Replace in whole file
vim.keymap.set("n", "<leader>R", ":%s///g<Left><Left><Left>", { desc = "Replace in file" })

-- Replace current word in file
vim.keymap.set("n", "<leader>sw", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", { desc = "Replace word in file" })

-- Close all tabs except current
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Tab only" })

-- Visual mode replace
vim.keymap.set("v", "<leader>r", ":s///g<Left><Left><Left>", { desc = "Replace in selection" })

-- Map <Leader>1..9 to go to tab 1..9
for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, ":tabn " .. i .. "<CR>", { desc = "Go to tab " .. i })
end

-- Map <Leader>0 to go to the last tab
vim.keymap.set("n", "<leader>0", ":tablast<CR>", { desc = "Go to last tab" })
