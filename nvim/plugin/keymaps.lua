local set = vim.keymap.set

set("n", "K", vim.lsp.buf.hover)
set("n", "<M-CR>", ":lua vim.lsp.buf.code_action()<cr>")
set("n", "<leader>rn", vim.lsp.buf.rename)

set("i", "<C-h>", vim.lsp.buf.signature_help)

set("n", "gf", "<cmd>diffget //2<CR>")
set("n", "gj", "<cmd>diffget //3<CR>")

-- Basic movement keybinds, these make navigating splits easy for me
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")

-- Quickfix
set("n", "<leader>h", "<cmd>cnext<CR>zz", { desc = "Forward qfixlist" })
set("n", "<leader>;", "<cmd>cprev<CR>zz", { desc = "Backward qfixlist" })

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- There are builtin keymaps for this now, but I like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "<leader>vd", vim.diagnostic.open_float)

-- These mappings control the size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<M-j>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! ]c]]
  else
    vim.cmd [[m .+1<CR>==]]
  end
end)

set("n", "<M-k>", function()
  if vim.opt.diff:get() then
    vim.cmd [[normal! [c]]
  else
    vim.cmd [[m .-2<CR>==]]
  end
end)
