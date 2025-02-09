local set = vim.opt

set.signcolumn = "yes:1"
set.inccommand = "split"

set.smartcase = true
set.ignorecase = true
set.hlsearch = false
set.incsearch = true

set.nu = true
set.relativenumber = true

set.expandtab = true
set.smartindent = true
set.tabstop = 2
set.shiftwidth = 2
set.wrap = false

set.splitbelow = true
set.splitright = true

set.shada = { "'10", "<0", "s10", "h" }

set.termguicolors = true
set.clipboard = "unnamedplus"

set.scrolloff = 8

-- Don't have `o` add a comment
set.formatoptions:remove "o"

set.updatetime = 50
set.swapfile = false
set.backup = false
set.undodir = os.getenv "HOME" .. "/.vim/undodir"
set.undofile = true
