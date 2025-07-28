return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "1.*",
    opts = {
      keymap = { preset = "default" },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },
      completion = {
        ghost_text = {
          enabled = true,
        },
        documentation = {
          window = {
            border = "rounded",
            winblend = 15,
          },
        },
        menu = {
          border = "rounded",
          winblend = 15,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
          winblend = 15,
        },
      },
    },
  },
}
