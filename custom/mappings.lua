M = {}

M.custom_mapping = {
  n = {
    ["+"] = {
      "<cmd>vertical resize +5<cr>",
      "v resize right"
    },
    ["_"] = {
      "<cmd>vertical resize -5<cr>",
      "v resize left"
    },
    ["="] = {
      "<cmd>resize +5<cr>",
      "h resize up"
    },
    ["-"] = {
      "<cmd>resize -5<cr>",
      "h resize down"
    },
  },
}

return M
