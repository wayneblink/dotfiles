local opt = vim.opt

-- You have to turn this one on :)
opt.inccommand = "split"

-- Best search settings :)
opt.smartcase = true
opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true

----- Personal Preferences -----
opt.nu = true
opt.relativenumber = true

opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.termguicolors = true
opt.clipboard = "unnamedplus"

opt.scrolloff = 8
opt.signcolumn = "yes"

-- Don't have `o` add a comment
opt.formatoptions:remove "o"

opt.updatetime = 50
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true
