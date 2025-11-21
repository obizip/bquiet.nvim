local opts = require("bquiet.config").get_options()
opts.style = "light"
require("bquiet").setup(opts)
require("bquiet").load()
vim.g.colors_name = "bquiet-light"
