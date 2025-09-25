vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.swapfile = false
vim.opt.shiftwidth = 2
vim.opt.hlsearch = false
vim.g.mapleader = " "

-- prevent the built-in vim.lsp.completion autotrigger from selecting the first item
vim.opt.completeopt = { "menuone", "noselect", "popup" }

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

