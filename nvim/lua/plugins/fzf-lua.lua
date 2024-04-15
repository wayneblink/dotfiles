return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>",                     desc = "Find files" },
    { "<C-p>",      "<cmd>FzfLua git_files<cr>",                 desc = "Find files" },
    { "<leader>pf", "<cmd>FzfLua files<cr>",                     desc = "Find files" },
    { "<leader>fg", "<cmd>FzfLua live_grep_glob<cr>",            desc = "Grep" },
    { "<leader>ps", "<cmd>FzfLua live_grep_glob<cr>",            desc = "Grep" },
    { "<leader>fg", "<cmd>FzfLua grep_visual<cr>",               desc = "Grep",                 mode = "x" },
    { "gd",         "<cmd>FzfLua lsp_definitions<cr>",           desc = "Grep", },
    { "gr",         "<cmd>FzfLua lsp_references<cr>",            desc = "Grep", },
    { "gi",         "<cmd>FzfLua lsp_implementations<cr>",       desc = "Grep", },
    { "<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<cr>",  desc = "Document diagnostics" },
    { "<leader>fD", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>",                 desc = "Help" },
    { "<leader>fo", "<cmd>FzfLua oldfiles<cr>",                  desc = "Recently opened files" },
    { "gt",         "<cmd>FzfLua lsp_typedefs<cr>",              desc = "Recently opened files" },
  },
  opts = function()
    local actions = require("fzf-lua.actions")
    return ({
      fzf_colors = {
        bg = { "bg", "Normal" },
        gutter = { "bg", "Normal" },
        scrollbar = { "bg", "Normal" },
      },
      fzf_opts = {
        ["--info"] = "default",
        ["--layout"] = "reverse-list",
      },
      keymap = {
        builtin = {
          ["<C-/>"] = "toggle-help",
          ["<C-f>"] = "toggle-fullscreen",
          ["<C-i>"] = "toggle-preview",
          ["<C-d>"] = "preview-page-down",
          ["<C-u>"] = "preview-page-up",
        },
        fzf = {
          ["alt-s"] = "toggle",
          ["alt-a"] = "toggle-all",
          ["ctrl-q"] = "select-all+accept",
        },
      },
      winopts = {
        height = 0.7,
        width = 0.55,
        preview = {
          scrollbar = false,
          layout = "vertical",
          vertical = "up:40%",
        },
        winhighlight = {
          Normal = "Normal", FloatBorder = "DiagnosticInfo"
        }
      },
      hls = { border = "Normal" }
    })
  end,
}
