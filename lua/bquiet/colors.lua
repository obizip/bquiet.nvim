local M = {}

local light_colors = {
  foreground = {
    normal = "#282D35",
    primary1 = "#2D716C",
    primary2 = "#357A74",
    primary3 = "#357A74",
    primary4 = "#282D35",
    secondary1 = "#59616D",
    secondary2 = "#59616D",
    secondary3 = "#59616D",
  },
  background = {
    normal = "#F6F7F9",
    primary1 = "#2D716C",
    primary2 = "#DDE2E8",
    secondary1 = "#ECEFF2",
    secondary2 = "#DDE2E8",
  },
  ansi = {
    black = "#F6F7F9",
    blue = "#2D716C",
    brightyellow = "#357A74",
    cyan = "#2D716C",
    green = "#235B57",
    magenta = "#357A74",
    red = "#59616D",
    white = "#282D35",
    yellow = "#2D716C",
  },
  git = {
    add = "#2D716C",
    change = "#235B57",
    delete = "#59616D",
  },
  diff = {
    add = "#235B57",
    delete = "#59616D",
    change = "#59616D",
    text = "#2D716C",
  },
  diag = {
    error = "#59616D",
    warn = "#59616D",
    hint = "#357A74",
    info = "#2D716C",
  },
}

local dark_colors = {
  foreground = {
    normal = "#D8DCE2",
    primary1 = "#55A7A2",
    primary2 = "#7CC7C1",
    primary3 = "#7CC7C1",
    primary4 = "#D8DCE2",
    secondary1 = "#AAB1BB",
    secondary2 = "#AAB1BB",
    secondary3 = "#AAB1BB",
  },
  background = {
    normal = "#16181D",
    primary1 = "#55A7A2",
    primary2 = "#292D35",
    secondary1 = "#1D2026",
    secondary2 = "#292D35",
  },
  ansi = {
    black = "#16181D",
    blue = "#55A7A2",
    brightyellow = "#7CC7C1",
    cyan = "#55A7A2",
    green = "#387D7A",
    magenta = "#7CC7C1",
    red = "#AAB1BB",
    white = "#D8DCE2",
    yellow = "#55A7A2",
  },
  git = {
    add = "#55A7A2",
    change = "#387D7A",
    delete = "#AAB1BB",
  },
  diff = {
    add = "#387D7A",
    delete = "#AAB1BB",
    change = "#AAB1BB",
    text = "#55A7A2",
  },
  diag = {
    error = "#AAB1BB",
    warn = "#AAB1BB",
    hint = "#7CC7C1",
    info = "#55A7A2",
  },
}

function M.setup(opts)
  local colors = vim.deepcopy(opts.style == "light" and light_colors or dark_colors)

  colors.none = "NONE"

  colors.type = colors.foreground.normal
  colors.operator = colors.foreground.primary3
  colors.constant = colors.foreground.primary1
  colors.comment = colors.foreground.primary2
  colors.keyword = colors.foreground.secondary1
  colors.delimiter = colors.foreground.secondary2

  colors.active = colors.background.primary1

  colors.fg = colors.foreground.normal
  colors.bg = colors.background.normal

  colors.bg_visual = colors.background.primary2

  colors.weak1 = colors.foreground.secondary3

  colors.strong1 = colors.ansi.brightyellow
  colors.strong2 = colors.ansi.yellow
  colors.strong3 = colors.ansi.magenta
  colors.strong4 = colors.ansi.blue

  colors.success = colors.ansi.green

  -- Shared roles also keep Neovim integrations in the Vim theme's palette.
  colors.bg0 = colors.bg
  colors.bg1 = colors.background.secondary1
  colors.bg2 = colors.background.primary2
  colors.fg0 = colors.fg
  colors.fg1 = colors.foreground.secondary2
  colors.accent_dark = colors.git.change
  colors.accent = colors.constant
  colors.accent_light = colors.comment

  colors.fg_popup = colors.fg1
  colors.bg_popup = colors.bg1
  colors.bg_float = colors.bg1
  colors.fg_border = colors.fg1
  colors.fg_gutter = colors.fg1
  colors.fg_sidebar = colors.fg0
  colors.bg_search = colors.accent
  colors.bg_statusline = colors.bg2

  opts.on_colors(colors)
  return colors
end

return M
