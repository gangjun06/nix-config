return {
  {
    "leoluz/nvim-dap-go",
    opts = function()
      -- https://github.com/mfussenegger/nvim-dap/discussions/1006
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            name = "Debug in external terminal (Arguments)",
            request = "launch",
            program = "${file}",
            args = require("dap-go").get_arguments,
            executable = {
              command = "/opt/homebrew/bin/ghostty",
              args = { "dlv", "dap", "-l", "127.0.0.1:${port}" },
            },
          },
        },
      })
    end,
  },
}

