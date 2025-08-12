vim.lsp.enable({
  "basedpyright",
  "fennel_ls",
  "gopls",
  "lua_ls",
  "nixd",
  "rust_analyzer",
  "sqls",
  "ts_ls",
})

vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
  virtual_text = true,
})
