# bquiet.nvim

A quiet Neovim colorscheme using the dark gray and teal palette from
`../obizip-bquiet.vim/colors/bquiet.vim`.

```lua
vim.cmd.colorscheme("bquiet")
```

`bquiet` defaults to the dark palette. You can also select `bquiet-dark` or
use `bquiet-light` for a light gray and teal palette with the same color roles.

Optional configuration, applied before loading the colorscheme:

```lua
require("bquiet").setup({
  style = "dark", -- "dark" or "light"
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
  },
  on_colors = function(colors)
    -- Customize palette values here.
  end,
  on_highlights = function(highlights, colors)
    -- Customize highlight definitions here.
  end,
})
vim.cmd.colorscheme("bquiet")
```

Includes Vim syntax groups (HTML, CSS, and Markdown), Neovim diagnostics,
Tree-sitter Markdown captures, Gitsigns, and Telescope highlights.
