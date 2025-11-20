local M = {}

M.defaults = {
  style = "light",
  transparent = false,
  styles = {
    comments = {},
    keywords = {},
    functions = {},
    variables = {},
  },
  terminal_colors = true,
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
}

M.options = nil

function M.get_options()
  return M.options or M.defaults
end

function M.setup(opts)
  M.options = opts and vim.tbl_deep_extend("force", M.defaults, opts) or M.defaults
end

return M
