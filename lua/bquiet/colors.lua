local M = {}

function M.setup(opts)
  local colors = {}

  colors.ansi = {
    black = "#333333",
    blue = "#71aed7",
    brightyellow = "#dfdf8e",
    cyan = "#47bea9",
    green = "#95cb82",
    magenta = "#cc8bc9",
    red = "#c33c33",
    white = "#cecece",
    yellow = "#cd974b",
  }

  colors.foreground = {
    normal = "#EEEEEE",

    primary1 = "#cc8bc9",
    primary2 = "#dfdf8e",
    primary3 = "#e2eeee",

    secondary1 = "#C0C0C0",
    secondary2 = "#999999",
    secondary3 = "#3b4261",
    secondary4 = "#708b8d",
  }

  colors.background = {
    normal = "#0e1415",

    primary1 = "#cd974b",
    primary2 = "#354c50",

    secondary1 = "#182325",
    secondary2 = "#162022",
  }

  colors.none = "NONE"


  colors.git = {
    add = "#449dab",
    change = "#6183bb",
    delete = "#914c54",
  }

  colors.diff = {
    add = "#6abf40",
    delete = "#d2322d",
    change = "#ec8013",
    text = colors.ansi.blue,
  }

  colors.diag = {
    error = "#d13e23",
    warn = "#f4b371",
    hint = "#8ebeec",
    info = "#88cc66",
  }

  --
  --
  --

  colors.type = colors.foreground.secondary1
  colors.operator = colors.foreground.primary3
  colors.constant = colors.foreground.primary1
  colors.comment = colors.foreground.primary2
  colors.keyword = colors.foreground.secondary1
  colors.delimiter = colors.foreground.secondary2

  colors.active = colors.background.primary1

  colors.fg = colors.foreground.normal
  colors.bg = colors.background.normal

  colors.fg_popup = colors.bg
  colors.bg_popup = colors.fg

  colors.fg_border = colors.foreground.primary3
  colors.fg_gutter = colors.foreground.secondary3

  colors.bg_visual = colors.background.primary2
  colors.bg_search = colors.background.primary2
  colors.bg_statusline = colors.background.secondary2

  colors.success = colors.ansi.green

  colors.strong1 = colors.ansi.brightyellow
  colors.strong2 = colors.ansi.yellow
  colors.strong3 = colors.ansi.magenta
  colors.strong4 = colors.ansi.blue

  colors.weak1 = colors.ansi.black

  opts.on_colors(colors)
  return colors
end

return M
