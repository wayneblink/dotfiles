vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+y')

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader><leader>", "<C-^>")
vim.keymap.set("n", "<M-CR>", ":lua vim.lsp.buf.code_action()<cr>")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>")

vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)

vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>")

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
