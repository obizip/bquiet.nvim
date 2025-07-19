---@param group string
---@param param table
local function hi(group, param)
  vim.api.nvim_set_hl(0, group, param)
end

---@param src string
---@param dst string
local function ln(src, dst)
  vim.api.nvim_set_hl(0, src, { link = dst })
end

---@param srcs table
---@param dst string
local function link_all(srcs, dst)
  for i = 1, #srcs do
    local src = srcs[i]
    ln(src, dst)
  end
end

local colors = {
  constant = "#8D8CD8",
  comment = "#33994E",
  accent = "#89AFD6",
  foreground = "#EEEEEE",
  background = "#14161B",
  emphasis = "#FFAF00",
  unimportant = "#999999",
  nontext = "#555555",
  hint = "#1971FF",
  info = "#00B06B",
  warn = "#F6AA00",
  error = "#FF4B00",
  highlighted_background = "#20242B",

  -- UI elements
  -- background = 'bg_0',
  ui_dim_background = '#252525',
  -- ui_background = '#111111',
  ui_background = '#21222B',

  visual = '#444444',
  cursor = '#b9b9b9',
  lens = '#4f9cfe',
  ui_text = '#dedede',
  ui_dim_text = '#777777',
  ui_widget = '#70b433',
  ui_highlight = '#a580e2',
  ui_extra_highlight = '#3fc5b7',

  -- Status elements
  added = "#00B06B",
  changed = "#F6AA00",
  deleted = "#FF4B00",
}

local function set_native_hl()
  hi("Normal", { fg = colors.foreground })
  hi("Comment", { fg = colors.comment })
  hi("Constant", { fg = colors.constant })
  hi('Ignore', { fg = colors.unimportant })
  hi('Operator', { fg = colors.accent })
  hi('Debug', { fg = colors.warn })
  hi('Error', { fg = colors.error })
  hi('Underlined', { fg = colors.foreground, underline = true })
  hi('Todo', { fg = colors.highlighted_background, bg = colors.warn, bold = true })
  hi("NonText", { fg = colors.nontext })
  hi("EndOfBuffer", { fg = colors.nontext })

  link_all({
    "Title", "Type", "Statement", 'Identifier', 'Macro', 'Repeat', 'StorageClass', 'Structure', 'Tag', 'Typedef',
    'Exception', "Terminal", 'Function', 'Special'
  }, "Normal")


  link_all({
    'Float', 'Number', 'SpecialChar', 'String', 'Boolean', 'Character', 'SpecialComment'
  }, "Constant")

  link_all({
    "Delimiter", 'Conditional', 'Define', 'Include', 'Keyword', 'Label', 'PreProc', 'PreCondit',
  }, "Ignore")

  link_all({
    "Conceal"
  }, "NonText")

  -- messages
  hi('ErrorMsg', { fg = colors.ui_text, bg = colors.error })
  hi('WarningMsg', { fg = colors.ui_background, bg = colors.warn })
  hi('MsgArea', { fg = colors.ui_text })
  hi('ModeMsg', { fg = colors.ui_highlight })
  ln('MoreMsg', 'ModeMsg')
  ln('Question', 'ModeMsg')

  -- statusline and other lines
  hi('StatusLine', { fg = colors.ui_text, bg = colors.ui_background })
  hi('StatusLineNC', { fg = colors.ui_dim_text, bg = colors.ui_dim_background })
  ln('StatusLineTerm', 'StatusLine')
  ln('StatusLineTermNC', 'StatusLineNC')
  ln('TabLine', 'StatusLineNC')
  ln('TabLineFill', 'StatusLineNC')
  ln('TabLineSel', 'StatusLine')
  ln('ToolbarButton', 'StatusLine')
  ln('ToolbarLine', 'StatusLineNC')
  hi('WildMenu', { fg = colors.ui_widget, bg = colors.ui_text })
  ln('WinBar', 'StatusLine')
  ln('WinBarNC', 'StatusLineNC')
  hi('VertSplit', { fg = colors.ui_background, bg = colors.ui_background })
  hi('WinSeparator', { fg = colors.ui_widget })

  -- cursor
  hi('ColorColumn', { bg = colors.ui_extra_highlight })
  -- hi('CursorColumn', { bg = colors.highlighted_background })
  hi('CursorColumn', {})
  ln('CursorLine', 'CursorColumn')
  hi('Cursor', { bg = colors.cursor })
  ln('CursorIM', 'Cursor')
  ln('lCursor', 'Cursor')
  hi('LineNr', { fg = colors.ui_dim_text })
  hi('CursorLineNr', { fg = colors.foreground, bold = true })
  hi('SignColumn', {})

  -- visual
  hi('Visual', { bg = colors.visual })
  ln('VisualNOS', 'Visual')

  -- Pmenu
  hi('Pmenu', { bg = colors.ui_background })
  hi('PmenuSel', { fg = colors.emphasis })
  ln('PmenuSbar', "Normal")
  ln('PmenuThumb', "Normal")

  -- folds
  hi('FoldColumn', { fg = colors.ui_dim_text })
  hi('Folded', { fg = colors.ui_dim_text, italic = true })

  -- search
  hi('Search', { fg = colors.emphasis })
  hi('CurSearch', { fg = colors.emphasis, reverse = true })
  ln('IncSearch', "Search")
  hi('MatchParen', { fg = colors.emphasis, bg = colors.highlighted_background })

  -- diagnostics
  hi('SpellBad', { fg = colors.warning, bg = colors.highlighted_background, underline = true })
  ln('SpellCap', 'SpellBad')
  ln('SpellLocal', 'SpellBad')
  ln('SpellRare', 'SpellBad')

  -- diff
  hi('DiffAdd', { fg = colors.highlighted_background, bg = colors.added })
  hi('DiffChange', { fg = colors.highlighted_background, bg = colors.changed })
  hi('DiffDelete', { fg = colors.highlighted_background, bg = colors.deleted })
  ln('DiffText', 'Normal')
  ln('diffAdded', 'DiffAdd')
  ln('diffChanged', 'DiffChange')
  ln('diffRemoved', 'DiffDelete')
  ln('diffLine', 'DiffText')

  -- other
  hi('Directory', { fg = colors.ui_highlight })
end

local function set_lsp_hl()
  hi("DiagnosticHint", { fg = colors.hint, bold = true })
  hi("DiagnosticInfo", { fg = colors.info, bold = true })
  hi("DiagnosticWarn", { fg = colors.warn, bold = true })
  hi("@lsp.type", { fg = colors.constant, bold = true })
end

local function set_treesitter_hl()
  ln("@constructor", "Ignore")
  hi("@markup.heading", { fg = colors.emphasis, bold = true })
  hi("@markup.list.markdown", { fg = colors.accent, bold = true })
  hi("@tag", { fg = colors.accent })
  hi("@type", { fg = colors.constant })
end

local function set_plugin_hl()
  ln("TelescopeMatching", "Search")
end

local function set_highlights()
  set_native_hl()
  set_lsp_hl()
  set_treesitter_hl()
  set_plugin_hl()
end

return { set_highlights = set_highlights }
