return {
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "normal",
          floats = "transparent",
        },
      })
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
}
