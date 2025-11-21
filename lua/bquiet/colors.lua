local M = {}

local light_colors = {
  foreground = {
    normal = "#000000",

    primary1 = "#7a3e9d",
    primary2 = "#aa3731",
    primary3 = "#325cc0",

    secondary1 = "#696969",
    secondary2 = "#888888",
  },
  background = {
    normal = "#E2E2E9",

    primary1 = "#A85A00",
    primary2 = "#C0C0C0",

    secondary1 = "#C0C0C0",
    secondary2 = "#E0E0E0",
    secondary3 = "#3b4261",
  },
  ansi = {
    black = "#000000",
    blue = "#325cc0",
    brightyellow = "#D88300",
    cyan = "#0083b2",
    green = "#448c27",
    magenta = "#7a3e9d",
    red = "#aa3731",
    white = "#f7f7f7",
    yellow = "#cb9000",
  },
  git = {
    add    = "#008B00",
    change = "#0040FF",
    delete = "#E60026",
  },
  diff = {
    add = "#284918",
    delete = "#B40600",
    change = "#ec8013",
    text = "#71aed7",
  },
  diag = {
    error = "#d13e23",
    warn = "#BC7500",
    hint = "#325cc0",
    info = "#278C00",
  }
}

local dark_colors = {
  foreground = {
    normal = "#EEEEEE",

    primary1 = "#cc8bc9",
    primary2 = "#bdbd6c",
    primary3 = "#e2eeee",

    secondary1 = "#C0C0C0",
    secondary2 = "#999999",
    secondary3 = "#3b4261",
  },
  background = {
    normal = "#0e1415",

    primary1 = "#cd974b",
    primary2 = "#354c50",

    secondary1 = "#182325",
    secondary2 = "#162022",
  },
  ansi = {
    black = "#333333",
    blue = "#71aed7",
    brightyellow = "#dfdf8e",
    cyan = "#47bea9",
    green = "#95cb82",
    magenta = "#cc8bc9",
    red = "#c33c33",
    white = "#cecece",
    yellow = "#cd974b",
  },
  git = {
    add = "#449dab",
    change = "#6183bb",
    delete = "#914c54",
  },
  diff = {
    add = "#6abf40",
    delete = "#d2322d",
    change = "#ec8013",
    text = "#71aed7",
  },
  diag = {
    error = "#d13e23",
    warn = "#f4b371",
    hint = "#8ebeec",
    info = "#88cc66",
  }
}

function M.setup(opts)
  local colors = opts.style == "light" and light_colors or dark_colors

  colors.none = "NONE"

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
