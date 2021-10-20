local g = vim.g
local map = vim.api.nvim_set_keymap
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

-- Taken from the Config recipes
local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

telescope.setup {
  defaults = {
    buffer_previewer_maker = new_maker,
  },
}

telescope.load_extension('fzy_native')

map('n', '<leader>ff', '<cmd>Telescope find_files hidden=true<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)
map('n', '<leader>fB', '<cmd>Telescope file_browser hidden=true<cr>', options)
