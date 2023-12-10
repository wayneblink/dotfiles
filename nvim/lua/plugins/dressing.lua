return {
  "stevearc/dressing.nvim",
  lazy = true,
  opts = {
    input = {
      win_options = {
        winhighlight = 'FloatBorder:LspFloatWinBorder',
      }
    },
    select = {
      trim_prompt = false,
      get_config = function(opts)
        if opts.kind == 'codeaction' then
          return {
            backend = 'builtin',
            builtin = {
              relative = 'cursor',
              max_height = 0.33,
              min_height = 5,
              max_width = 0.40,
              mappings = { ['q'] = 'Close' },
              win_options = {
                winhighlight = 'FloatBorder:LspFloatWinBorder,DressingSelectIdx:LspInfoTitle,MatchParen:Ignore',
              },
            },
          }
        end

        local winopts = { height = 0.6, width = 0.5 }

        -- Smaller menu for snippet choices.
        if opts.kind == 'luasnip' then
          opts.prompt = 'Snippet choice: '
          winopts = { height = 0.35, width = 0.3 }
        end

        -- Add a colon to the prompt if it doesn't have one.
        if opts.prompt and not opts.prompt:match ':%s*$' then
          opts.prompt = opts.prompt .. ': '
        end

        -- Fallback to fzf-lua.
        return {
          backend = 'fzf_lua',
          fzf_lua = { winopts = winopts },
        }
      end,
    },
  },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require('lazy').load { plugins = { 'dressing.nvim' } }
      return vim.ui.select(...)
    end
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.input = function(...)
      require('lazy').load { plugins = { 'dressing.nvim' } }
      return vim.ui.input(...)
    end
  end,
}
