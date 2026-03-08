local set = vim.opt

set.termguicolors = true

set.nu = true
set.relativenumber = true

set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = true
set.incsearch = false

set.scrolloff = 15

set.colorcolumn = "80"

set.clipboard = "unnamedplus"

vim.g.mapleader = " "
