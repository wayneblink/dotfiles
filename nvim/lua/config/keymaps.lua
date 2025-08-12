local set = vim.keymap.set

-- TODO: set in ideavimrc
-- use defaults grn, gra, grr, gri, gO, ctrl-s, gf
-- https://neovim.io/doc/user/lsp.html
set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("t", "<leader><esc>", "<c-\\><c-n>")

-- Testing
set("n", "<leader><leader>x", "<cmd>source %<CR>")
set("n", "<leader>x", ":.lua<CR>")
set("v", "<leader>x", ":.lua<CR>")

vim.diagnostic.config({ jump = { float = true } })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
