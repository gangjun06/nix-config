-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

local opt = vim.opt
opt.clipboard = ""

opt.scrolloff = 10
opt.smarttab = true
opt.tabstop = 2
opt.wrap = false
opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"
opt.mouse = ""

opt.formatoptions:append({ "r" })

vim.g.lazyvim_prettier_needs_config = false
