vim.lsp.enable({
  "angularls",
  "basedpyright",
  "clangd",
  "fennel_ls",
  "gopls",
  "lua_ls",
  "nixd",
  "roslyn",
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
