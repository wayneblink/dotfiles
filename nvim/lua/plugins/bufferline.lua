return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        show_close_icone = false,
        show_buffer_close_icons = false,
        truncate_names = false,
        indicator = { style = "underline" },
        diagnostics = "nvim_lsp",
      },
    },
    keys = {
      -- Buffer navigation.
      { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "Pick a buffer to open" },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Select a buffer to close" },
      { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close buffers to the left" },
      { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close buffers to the right" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
    },
  },
}
