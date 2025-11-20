local M = {}

function M.load()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.api.nvim_command("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "bquiet"

  local opts = require("bquiet.config").get_options()
  local colors = require("bquiet.colors").setup(opts)
  local hl_table = require("bquiet.groups").setup(colors, opts)

  for group, hl in pairs(hl_table) do
    hl = type(hl) == "string" and { link = hl } or hl
    vim.api.nvim_set_hl(0, group, hl)
  end
end

M.setup = require("bquiet.config").setup

return M
