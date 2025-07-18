vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.g.mapleader = " "
vim.cmd.set "nowrap"
vim.cmd.set "nohlsearch"

-- navigate nvim panes
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- copy to clipboard
vim.keymap.set('v', "<leader>y", '"+y')

-- tabs
vim.keymap.set('n', "<leader>tn", '<cmd>tabnew<cr>')
vim.keymap.set('n', "<leader>tc", '<cmd>tabclose<cr>')
vim.keymap.set('n', "<leader>tl", '<cmd>tabnext<cr>')
vim.keymap.set('n', "<leader>th", '<cmd>tabprevious<cr>')
vim.keymap.set('n', "<leader>to", '<cmd>tabonly<cr>')
vim.keymap.set('n', "<leader>tml", '<cmd>+tabmove<cr>')
vim.keymap.set('n', "<leader>tmh", '<cmd>-tabmove<cr>')

-- line numbers
vim.wo.relativenumber = true
