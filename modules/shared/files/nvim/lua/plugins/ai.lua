return {
  --   {
  --     -- Original : "coder/claudecode.nvim",
  --     "coder/claudecode.nvim",
  --     -- branch = "feat/add-bin-path-config",
  --     dependencies = { "folke/snacks.nvim" },
  --     config = true,
  --     opts = {
  --       log_level = "debug",
  --       terminal = {
  --         provider = "native",
  --       },
  --     },
  --     keys = {
  --       { "<leader>a", nil, desc = "AI/Claude Code" },
  --       { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
  --       { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
  --       { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
  --       { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
  --       { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
  --       { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
  --       {
  --         "<leader>as",
  --         "<cmd>ClaudeCodeTreeAdd<cr>",
  --         desc = "Add file",
  --         ft = { "NvimTree", "neo-tree", "oil" },
  --       },
  --       -- Diff management
  --       { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
  --       { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  --     },
  --   },
  -- }
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
}
