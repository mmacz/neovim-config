return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local vscode = require('dap.ext.vscode')

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    dap.adapters.lldb = {
      type = 'executable',
      command = 'lldb-dap',
      name = 'lldb'
    }

    vscode.load_launchjs(nil, {
      lldb = { "c", "cpp", "rust"},
      }
    )

    vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dB", function() dap.toggle_breakpoint(vim.fn.input("Condition: ")) end, { desc = "DAP: Toggle conditional breakpoint" })
    vim.keymap.set("n", "<leader>dso", function() dap.step_over() end, { desc = "DAP: Step over" })
    vim.keymap.set("n", "<leader>dsi", function() dap.step_into() end, { desc = "DAP: Step into" })
    vim.keymap.set("n", "<leader>dst", function() dap.step_out() end, { desc = "DAP: Step out" })
    vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "DAP: Continue" })
    vim.keymap.set("n", "<leader>dt", function() dap.terminate() end, { desc = "DAP: Terminate " })
  end,
}

