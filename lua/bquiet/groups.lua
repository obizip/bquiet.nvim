local M = {}

function M.setup(colors, opts)
  local highlights = M.get(colors, opts)
  opts.on_highlights(highlights, colors)
  return highlights
end

function M.get(c, opts)
  local bg = opts.transparent and c.none or c.bg0
  local highlights = {

    -- Core
    Normal = { fg = c.fg0, bg = bg },
    Cursor = { fg = c.bg0, bg = c.fg0 },
    CursorLine = { bg = c.bg1 },
    CursorColumn = { bg = c.bg1 },
    ColorColumn = { bg = c.bg2 },

    -- Line numbers
    LineNr = { fg = c.fg1, bg = bg },
    CursorLineNr = { fg = c.fg0, bg = c.bg1, bold = true },

    -- Selection / Search
    Visual = { fg = c.fg0, bg = c.bg2 },
    VisualNOS = { fg = c.fg1, bg = c.bg2 },
    Search = { fg = c.bg0, bg = c.accent },
    IncSearch = { fg = c.bg0, bg = c.accent_light, bold = true },
    CurSearch = { fg = c.bg0, bg = c.accent_light, bold = true },
    Substitute = { fg = c.bg0, bg = c.accent, bold = true },
    MatchParen = { fg = c.fg0, bg = c.bg2, bold = true, underline = true },

    -- Semantic values
    Comment = { fg = c.accent_light, italic = true },
    Constant = { fg = c.accent },
    Number = { fg = c.accent },
    String = { fg = c.accent },

    -- Syntax structure
    Identifier = { fg = c.fg0 },
    Function = { fg = c.fg0 },
    Delimiter = { fg = c.fg1 },
    Statement = { fg = c.fg1 },
    Operator = { fg = c.accent_light },
    PreProc = { fg = c.fg1 },
    Type = { fg = c.fg0 },
    TypeDef = { fg = c.fg0 },
    StorageClass = { fg = c.fg1 },
    Structure = { fg = c.fg1 },
    Label = { fg = c.fg1 },

    -- Special values
    Special = { fg = c.accent },
    Underlined = { fg = c.accent, underline = true },
    Todo = { fg = c.accent_light, bold = true },

    -- Low-priority UI
    Ignore = { fg = c.fg1 },
    SpecialKey = { fg = c.fg1 },
    NonText = { fg = c.fg1 },
    Whitespace = { fg = c.fg1 },
    EndOfBuffer = { fg = c.fg1 },

    -- Folds
    Folded = { fg = c.fg1, bg = c.bg1 },
    FoldColumn = { fg = c.fg1, bg = bg },

    -- Sign column
    SignColumn = { bg = bg },

    -- Messages
    Title = { fg = c.fg0, bold = true },
    Directory = { fg = c.fg1 },
    ModeMsg = { fg = c.fg0, bold = true },
    MoreMsg = { fg = c.fg1 },
    Question = { fg = c.accent },
    MsgArea = { fg = c.fg0, bg = bg },
    MsgSeparator = { fg = c.fg1, bg = bg },
    Error = { underline = true },
    WarningMsg = { underline = true },

    -- Diagnostics
    DiagnosticUnderlineError = { underline = true },
    DiagnosticUnderlineWarn = { underline = true },
    DiagnosticUnderlineInfo = { underline = true },
    DiagnosticUnderlineHint = { underline = true },

    -- Spell checking
    SpellBad = { undercurl = true },
    SpellCap = { undercurl = true },
    SpellLocal = { undercurl = true },
    SpellRare = { undercurl = true },

    -- Popup menu
    Pmenu = { fg = c.fg1, bg = c.bg1 },
    PmenuSel = { fg = c.bg0, bg = c.accent, bold = true },
    PmenuSbar = { bg = c.bg2 },
    PmenuThumb = { bg = c.fg1 },
    PmenuMatch = { fg = c.accent, bg = c.bg1, bold = true },
    PmenuMatchSel = { fg = c.bg0, bg = c.accent_light, bold = true },

    -- Floating windows
    NormalFloat = { fg = c.fg0, bg = c.bg1 },
    FloatBorder = { fg = c.fg1, bg = c.bg1 },

    -- Status line
    StatusLine = { fg = c.fg0, bg = c.bg2, bold = true },
    StatusLineNC = { fg = c.fg1, bg = c.bg1 },

    -- Tabs
    TabLine = { fg = c.fg1, bg = c.bg1 },
    TabLineFill = { fg = c.fg1, bg = c.bg1 },
    TabLineSel = { fg = c.fg0, bg = c.bg2, bold = true },

    -- Window separators
    VertSplit = { fg = c.bg2, bg = bg },
    WinSeparator = { fg = c.bg2, bg = bg },

    -- Wild menu
    WildMenu = { fg = c.bg0, bg = c.fg0, bold = true },

    -- Quickfix
    QuickFixLine = { fg = c.fg0, bg = c.bg2, bold = true },

    -- Diff
    DiffAdd = { fg = c.accent_dark, bg = c.bg1 },
    DiffChange = { fg = c.fg1, bg = c.bg2 },
    DiffDelete = { fg = c.fg1, bg = c.bg1 },
    DiffText = { fg = c.accent, bg = c.bg2, bold = true },

    -- Generic added / changed / removed
    Added = { fg = c.accent },
    Changed = { fg = c.accent_dark },
    Removed = { fg = c.fg1 },

    -- Language-specific
    cucumberTags = { fg = c.accent },
    htmlTagN = { fg = c.fg1 },
    rubySymbol = { fg = c.accent },

    -- HTML
    htmlTag = { fg = c.fg1 },
    htmlEndTag = { fg = c.fg1 },
    htmlTagName = { fg = c.fg0 },
    htmlArg = { fg = c.fg1 },
    htmlString = { fg = c.accent },
    htmlComment = { fg = c.accent_light, italic = true },
    htmlSpecialChar = { fg = c.accent },

    -- CSS
    cssSelectorOp = { fg = c.accent_light },
    cssSelectorOp2 = { fg = c.accent_light },
    cssClassName = { fg = c.fg0 },
    cssIdentifier = { fg = c.fg0 },
    cssTagName = { fg = c.fg0 },
    cssProp = { fg = c.fg1 },
    cssAttr = { fg = c.fg1 },
    cssStringQ = { fg = c.accent },
    cssStringQQ = { fg = c.accent },
    cssColor = { fg = c.accent },
    cssValueNumber = { fg = c.accent },
    cssValueLength = { fg = c.accent },
    cssValueInteger = { fg = c.accent },
    cssComment = { fg = c.accent_light, italic = true },
    cssImportant = { fg = c.accent_light, bold = true },

    -- Markdown
    markdownH1 = { fg = c.fg0, bold = true },
    markdownH2 = { fg = c.fg0, bold = true },
    markdownH3 = { fg = c.fg0, bold = true },
    markdownH4 = { fg = c.fg1, bold = true },
    markdownH5 = { fg = c.fg1, bold = true },
    markdownH6 = { fg = c.fg1, bold = true },
    markdownHeadingDelimiter = { fg = c.accent_light, bold = true },
    markdownListMarker = { fg = c.accent_light },
    markdownOrderedListMarker = { fg = c.accent_light },
    markdownBlockquote = { fg = c.accent_light, italic = true },
    markdownBold = { fg = c.fg0, bold = true },
    markdownItalic = { fg = c.fg1, italic = true },
    markdownBoldItalic = { fg = c.fg0, bold = true, italic = true },
    markdownCode = { fg = c.accent },
    markdownCodeBlock = { fg = c.accent },
    markdownCodeDelimiter = { fg = c.accent_light },
    markdownLinkText = { fg = c.accent, underline = true },
    markdownUrl = { fg = c.accent, underline = true },
    markdownLinkDelimiter = { fg = c.accent_light },
    markdownLinkTextDelimiter = { fg = c.accent_light },
    markdownRule = { fg = c.accent_light },
    markdownEscape = { fg = c.accent_light },
    markdownError = { underline = true },
    markdownId = { fg = c.accent },
    markdownIdDeclaration = { fg = c.accent },
    markdownAutomaticLink = { fg = c.accent, underline = true },
    markdownUrlTitle = { fg = c.accent },
    markdownFootnote = { fg = c.accent_light },
    markdownFootnoteDefinition = { fg = c.accent_light },
  }

  -- Neovim UI and integrations use the same semantic roles.
  local links = {
    lCursor = "Cursor",
    CursorIM = "Cursor",
    NormalNC = "Normal",
    NormalSB = "Normal",
    FloatTitle = "Title",
    ErrorMsg = "Error",
    LineNrAbove = "LineNr",
    LineNrBelow = "LineNr",
    WinBar = "StatusLine",
    WinBarNC = "StatusLineNC",
    Character = "Constant",
    Boolean = "Constant",
    Float = "Number",
    Conditional = "Statement",
    Repeat = "Statement",
    Keyword = "Statement",
    Exception = "Statement",
    Include = "PreProc",
    Define = "PreProc",
    Macro = "PreProc",
    PreCondit = "PreProc",
    SpecialChar = "Special",
    Tag = "Special",
    SpecialComment = "Comment",
    Debug = "Special",
    debugBreakpoint = "Special",
    debugPC = "CursorLine",
    dosIniLabel = "Identifier",
    helpCommand = "Special",
    helpExample = "Comment",
    htmlH1 = "markdownH1",
    htmlH2 = "markdownH2",
    qfFileName = "Directory",
    qfLineNr = "LineNr",
    LspReferenceText = "Visual",
    LspReferenceRead = "Visual",
    LspReferenceWrite = "Visual",
    LspSignatureActiveParameter = "MatchParen",
    LspCodeLens = "Comment",
    LspInfoBorder = "FloatBorder",
    ComplHint = "Comment",
    healthError = "DiagnosticError",
    healthSuccess = "Added",
    healthWarn = "DiagnosticWarn",
    diffAdded = "Added",
    diffRemoved = "Removed",
    diffChanged = "Changed",
    diffOldFile = "Removed",
    diffNewFile = "Added",
    diffFile = "Directory",
    diffLine = "Comment",
    diffIndexLine = "Special",
    GitSignsAdd = "Added",
    GitSignsChange = "Changed",
    GitSignsDelete = "Removed",
    TelescopeMatching = "Special",
    ["@type"] = "Type",
    ["@type.builtin"] = "Type",
    ["@variable"] = "Identifier",
    ["@comment"] = "Comment",
    ["@operator"] = "Operator",
    ["@markup.heading.1"] = "markdownH1",
    ["@markup.heading.2"] = "markdownH2",
    ["@markup.heading.3"] = "markdownH3",
    ["@markup.heading.4"] = "markdownH4",
    ["@markup.heading.5"] = "markdownH5",
    ["@markup.heading.6"] = "markdownH6",
    ["@markup.heading"] = "Title",
    ["@markup.strong"] = "markdownBold",
    ["@markup.italic"] = "markdownItalic",
    ["@markup.quote"] = "markdownBlockquote",
    ["@markup.raw"] = "markdownCode",
    ["@markup.link"] = "markdownLinkText",
    ["@markup.link.label"] = "markdownLinkText",
    ["@markup.link.url"] = "markdownUrl",
    ["@markup.list"] = "markdownListMarker",
  }
  for group, target in pairs(links) do
    highlights[group] = { link = target }
  end

  highlights.Bold = { fg = c.fg0, bold = true }
  highlights.Italic = { fg = c.fg0, italic = true }
  highlights.LspInlayHint = { fg = c.fg1, bg = c.bg1 }
  highlights.DiagnosticUnnecessary = { fg = c.fg1 }

  for _, severity in ipairs({ "Error", "Warn", "Info", "Hint" }) do
    local color = c.diag[severity:lower()]
    highlights["Diagnostic" .. severity] = { fg = color }
    highlights["DiagnosticVirtualText" .. severity] = { fg = color }
  end

  for group, style in pairs({
    Comment = opts.styles.comments,
    Keyword = opts.styles.keywords,
    Function = opts.styles.functions,
    Identifier = opts.styles.variables,
  }) do
    if next(style) then
      local highlight = highlights[group]
      if highlight.link then
        highlight = vim.deepcopy(highlights[highlight.link])
      end
      highlights[group] = vim.tbl_extend("force", highlight, style)
    end
  end

  return highlights
end

return M
