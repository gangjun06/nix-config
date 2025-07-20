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

-- Custom commands
local function copy_with_lines()
  if vim.fn.mode():match("[vV�]") then
    vim.cmd("normal! gv")
  end

  local srow = vim.api.nvim_buf_get_mark(0, "<")[1]
  local erow = vim.api.nvim_buf_get_mark(0, ">")[1]

  if srow > erow then
    srow, erow = erow, srow
  end

  local linespec = (srow == erow) and ("#L" .. srow) or ("#L" .. srow .. "-L" .. erow)

  local relpath = vim.fn.expand("%:~:.")

  local clip = "@" .. relpath .. linespec
  vim.fn.setreg("+", clip)
  print("Copied: " .. clip)
end

vim.keymap.set("n", "<leader>C", function()
  local abs = vim.fn.expand("%:p")
  vim.fn.setreg("+", abs)
  print("Copied: " .. abs)
end, { desc = "Copy absolute file path", noremap = true })

vim.keymap.set("v", "<leader>C", copy_with_lines, { desc = "Copy relative path with line range", noremap = true })
