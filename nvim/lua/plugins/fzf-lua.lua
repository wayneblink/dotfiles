return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>f<", "<cmd>FzfLua resume<cr>", desc = "Resume last fzf command" },
    {
      "<leader>fb",
      function()
        require("fzf-lua").blines({
          winopts = {
            height = 0.6,
            width = 0.5,
            preview = { vertical = "up:70%" },
            -- Disable Treesitter highlighting for the matches.
            treesitter = {
              enabled = false,
              fzf_colors = { ["fg"] = { "fg", "CursorLine" }, ["bg"] = { "bg", "Normal" } },
            },
          },
          fzf_opts = {
            ["--layout"] = "reverse",
          },
        })
      end,
      desc = "Buffer lines",
      mode = { "n", "x" },
    },
    { "<leader>fd", "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Document diagnostics" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find files" },
    { "<leader>f/", "<cmd>FzfLua live_grep<cr>", desc = "Grep" },
    { "<leader>fg", "<cmd>FzfLua grep_visual<cr>", desc = "Grep", mode = "x" },
    { "<leader>fh", "<cmd>FzfLua help_tags<cr>", desc = "Help" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recently opened files" },
    { "z=", "<cmd>FzfLua spell_suggest<cr>", desc = "Spelling suggestions" },
  },
  opts = function()
    return {
      { "border-fused", "hide" },
      fzf_colors = {
        bg = { "bg", "Normal" },
        gutter = { "bg", "Normal" },
        info = { "fg", "Conditional" },
        scrollbar = { "bg", "Normal" },
        separator = { "fg", "Comment" },
      },
      fzf_opts = {
        ["--info"] = "default",
        ["--layout"] = "reverse-list",
      },
      oldfiles = {
        include_current_session = true,
      },
    }
  end,
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(items, opts, on_choice)
      local ui_select = require("fzf-lua.providers.ui_select")

      -- Register the fzf-lua picker the first time we call select.
      if not ui_select.is_registered() then
        ui_select.register(function(ui_opts)
          if ui_opts.kind == "luasnip" then
            ui_opts.prompt = "Snippet choice: "
            ui_opts.winopts = {
              relative = "cursor",
              height = 0.35,
              width = 0.3,
            }
          elseif ui_opts.kind == "color_presentation" then
            ui_opts.winopts = {
              relative = "cursor",
              height = 0.35,
              width = 0.3,
            }
          else
            ui_opts.winopts = { height = 0.5, width = 0.4 }
          end

          -- Use the kind (if available) to set the previewer's title.
          if ui_opts.kind then
            ui_opts.winopts.title = string.format(" %s ", ui_opts.kind)
          end

          return ui_opts
        end)
      end

      -- Don't show the picker if there's nothing to pick.
      if #items > 0 then
        return vim.ui.select(items, opts, on_choice)
      end
    end
  end,
}
