return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  keys = {
    { "<leader>tb", function() vim.o.background = vim.o.background == "dark" and "light" or "dark" end, desc = "Toggle light/dark theme" },
  },
  opts = {
    flavour = "auto", -- latte when 'background' is light, mocha when dark
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")

    -- Reload with the matching flavour when switching light/dark via
    -- `:set background=light` or `:set background=dark`.
    vim.api.nvim_create_autocmd("OptionSet", {
      pattern = "background",
      callback = function()
        vim.cmd.colorscheme("catppuccin")
      end,
    })
  end,
}
