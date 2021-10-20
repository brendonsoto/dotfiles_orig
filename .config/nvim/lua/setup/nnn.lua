local env = vim.env
local map = vim.api.nvim_set_keymap
local nnn = require("nnn")

nnn.setup({
  picker = {
    cmd = "tmux new-session -c \"$PWD\" nnn -Pt -H -E",
    style = { border = "rounded" },
    session = "local",
  },
  mappings = {
    { "<C-s>", "split" },
    { "<C-t>", "tsplit" },
    { "<C-v>", "vsplit" },
  },
  replace_netrw = "explorer",
  window_nav = "<C-l>"
})


map("n", "<C-p>", "<cmd>NnnPicker %:p:h<cr>", options)
map("t", "<C-p>", "<cmd>NnnPicker %:p:h<cr>", options)
map("n", "<C-e>", "<cmd>NnnExplorer %:p:h<cr>", options)
map("t", "<C-e>", "<cmd>NnnExplorer %:p:h<cr>", options)
