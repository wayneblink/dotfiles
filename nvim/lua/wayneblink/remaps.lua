local keymap = require("wayneblink.keymap");

local nnoremap = keymap.nnoremap;

vim.g.mapleader = " ";
nnoremap("<leader>", "<Nop>");
nnoremap("<leader>pv", "<cmd>Ex<CR>");
nnoremap("<leader>w", "<cmd>w<CR>");
nnoremap("<leader><leader>", "<C-^>");
