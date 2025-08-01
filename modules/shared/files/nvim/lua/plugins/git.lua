return {
  {
    "pwntester/octo.nvim",
    config = function()
      require("octo").setup({
        ssh_aliases = {
          ["github.com-work"] = "github.com",
          ["github.com-persenal"] = "github.com",
        },
      })
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({})
    end,
  },
}
