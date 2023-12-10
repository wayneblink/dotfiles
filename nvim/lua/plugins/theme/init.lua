return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
