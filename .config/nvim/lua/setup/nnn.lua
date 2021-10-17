local map = vim.api.nvim_set_keymap
local nnn = require("nnn")

nnn.setup({
  mappings = {
    { "<C-s>", "split" },
    { "<C-t>", "tsplit" },
    { "<C-v>", "vsplit" },
  },
  replace_netrw = "picker",
  windownav = "<C-l>"
})

local nnnOptions = " -H<cr>"

map("n", "<C-p>", "<cmd>NnnPicker" .. nnnOptions, options)
map("t", "<C-p>", "<cmd>NnnPicker" .. nnnOptions, options)
map("n", "<C-e>", "<cmd>NnnExplorer" .. nnnOptions , options)
map("t", "<C-e>", "<cmd>NnnExplorer" .. nnnOptions , options)
