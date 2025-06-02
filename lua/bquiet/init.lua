local theme = require('bquiet.theme')

local function setup()
  vim.cmd([[hi clear]])
  vim.cmd([[if exists("g:syntax_on") | syntax reset | endif]])

  theme.set_highlights()
  vim.g.colors_name = "bquiet"
end

return { setup = setup }
