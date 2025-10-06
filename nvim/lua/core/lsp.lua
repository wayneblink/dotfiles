vim.lsp.enable({
  "basedpyright",
  "fennel_ls",
  "gopls",
  "lua_ls",
  "nixd",
  "ruby_lsp",
  "rust_analyzer",
  "sqls",
  "vtsls",
  "zls",
})

vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
  virtual_text = true,
})
