return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    require("gruvbox").setup({
      transparent_mode = true,
      overrides = {
        Pmenu = { bg = "NONE" },
        PmenuSbar = { bg = "NONE" },
        PmenuSel = { bg = "NONE" },
        PmenuThumb = { bg = "NONE" },
        FlatBorder = { bg = "NONE" },
      },
    })
    vim.cmd("colorscheme gruvbox")
  end,
}
