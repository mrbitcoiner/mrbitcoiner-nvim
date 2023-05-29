local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
   formatting.rustfmt,
}

null_ls.setup {
   debug = true,
   sources = sources,
}
