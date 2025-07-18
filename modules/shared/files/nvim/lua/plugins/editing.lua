return {
  {
    "andrewferrier/debugprint.nvim",

    dependencies = {
      "echasnovski/mini.nvim", -- Optional: Needed for line highlighting (full mini.nvim plugin)
      -- ... or ...
      "echasnovski/mini.hipatterns", -- Optional: Needed for line highlighting ('fine-grained' hipatterns plugin)

      "ibhagwan/fzf-lua", -- Optional: If you want to use the `:Debugprint search` command with fzf-lua
      "nvim-telescope/telescope.nvim", -- Optional: If you want to use the `:Debugprint search` command with telescope.nvim
      "folke/snacks.nvim", -- Optional: If you want to use the `:Debugprint search` command with snacks.nvim
    },

    lazy = false, -- Required to make line highlighting work before debugprint is first used
    version = "*", -- Remove if you DON'T want to use the stable version
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          "SmiteshP/nvim-navic",
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
        keys = {
          { "<leader>o", "<cmd>Navbuddy<cr>", desc = "Nav" },
        },
      },
    },
  },
}
