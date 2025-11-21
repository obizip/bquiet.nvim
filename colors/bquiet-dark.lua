local opts = require("bquiet.config").get_options()
opts.style = "dark"
require("bquiet").setup(opts)
require("bquiet").load()
vim.g.colors_name = "bquiet-dark"
