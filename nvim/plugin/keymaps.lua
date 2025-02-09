local set = vim.keymap.set

-- TODO: https://neovim.io/doc/user/lsp.html
-- use defaults grn, gra, grr, gri, gO, ctrl-s, gf
-- set in ideavimrc

set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- Quickfix
set("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
set("n", "<leader>;", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

set("n", "<leader><leader>x", "<cmd>source %<CR>")
set("n", "<leader>x", ":.lua<CR>")
set("v", "<leader>x", ":.lua<CR>")

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set('n', '-', '<cmd>Oil<CR>')

set("t", "<esc><esc>", "<c-\\><c-n>")

vim.diagnostic.config({ jump = { float = true } })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
