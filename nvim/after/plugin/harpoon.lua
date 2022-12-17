local _, ui = pcall(require, "harpoon.ui")
local ok, mark = pcall(require, "harpoon.mark")

if not ok then
    return
end

local nnoremap = require("wayneblink.keymap").nnoremap;

local ui = require("harpoon.ui");
local mark = require("harpoon.mark");

nnoremap("<leader>a", function() mark.add_file() end)
nnoremap("<C-e>", function() ui.toggle_quick_menu() end)
nnoremap("<C-h>", function() ui.nav_file(1) end)
nnoremap("<C-t>", function() ui.nav_file(2) end)
nnoremap("<C-n>", function() ui.nav_file(3) end)
nnoremap("<C-s>", function() ui.nav_file(4) end)
