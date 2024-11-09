-- Personal preferences
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.g.mapleader = " "
vim.cmd.set "nowrap" 


-- Install Lazy.vim package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

-- Plugin configs
require("lazy").setup("plugins")


require("nvim-treesitter.configs").setup{
  ensure_installed = {"lua", "nix"},
  highlight = {enable = true},
}

vim.keymap.set("n", "<C-b>", ":Neotree filesystem reveal left<CR>")
