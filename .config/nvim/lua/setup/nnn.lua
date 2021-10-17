local env = vim.env
local map = vim.api.nvim_set_keymap
local nnn = require("nnn")

env["NNN_PLUG"] = "t:preview-tui"

nnn.setup({
  picker = {
    cmd = "tmux new-session nnn -Pp",
    style = { border = "rounded" },
    session = "shared",
  },
  mappings = {
    { "<C-s>", "split" },
    { "<C-t>", "tsplit" },
    { "<C-v>", "vsplit" },
  },
  replace_netrw = "picker",
  window_nav = "<C-l>"
})

local nnnOptions = " -H<cr>"

map("n", "<C-p>", "<cmd>NnnPicker" .. nnnOptions, options)
map("t", "<C-p>", "<cmd>NnnPicker" .. nnnOptions, options)
map("n", "<C-e>", "<cmd>NnnExplorer" .. nnnOptions , options)
map("t", "<C-e>", "<cmd>NnnExplorer" .. nnnOptions , options)
