return {
      "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        dap.adapters["pwa-node"] = {
          type = "server",
          host = "127.0.0.1",
          port = 8123,
          executables = {
            command = "js-debug-adapter",
          },
        }

        for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
          dap.configurations[language] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Launch file",
              program = "${file}",
              cwd = "${workspaceFolder}",
              runtimeExecutable = "node",
            },
          }
        end
      end,
    },
    {
      "rcarriga/nvim-dap-ui",
      event = "VeryLazy",
      degendencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        require("dapui").setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    }
