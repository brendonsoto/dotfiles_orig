local wk = require("which-key")

wk.setup {}


wk.register({
  ["<leader>"] = {
    name = 'Non-Plugin-Leader stuff ',
    -- Nav
    l = { "<C-w>l", "Move right" },
    k = { "<C-w>k", "Move up" },
    j = { "<C-w>j", "Move down" },
    h = { "<C-w>h", "Move left" },

    -- File stuff
    e = { ':e ', 'Open a file' },
    w = { ':w<cr>', 'Save!' },
    q = { ':q<cr>', 'Quit!' },
    Q = { ':qa<cr>', 'Quit all!' },

    -- Clipboard
    y = { 'y "+y', 'Yank from clipboard' },
    p = { 'p "+p', 'Paste from clipboard' },

    -- Misc
    ['/'] = { ':nohl<cr>', 'Undo highlighting' },

    -- Tagbar
    -- t = { ':TagbarToggle<cr>', 'Tagbar toggle' },

    -- Find stuff
    f = {
      -- fm-nvim
      m = { ':Lf %:p:h<cr>', 'File browser (using lf)' },

      -- telescope
      f = { '<cmd>Telescope find_files<cr>', 'Find files' },
      g = { '<cmd>Telescope live_grep<cr>', 'Live grep' },
      b = { '<cmd>Telescope buffers<cr>', 'Find Buffer' },
      h = { '<cmd>Telescope help_tags<cr>', 'Find help tag' },
      p = { '<cmd>Telescope projects<cr>', 'Find projects' },
      ['ts'] = { '<cmd>Telescope treesitter<cr>', 'Telescope Treesitter?' },
    },

    -- Git stuff
    g = {
      b = { '<cmd>Telescope git_branches<cr>', 'Git branches' },
      c = {
        b = { '<cmd>Telescope git_bcommits<cr>', 'Git commits for buffer' },
      },
    },
  },
})


wk.register({
  name = 'normal mode stuff',
  j = { 'gj', 'Move down a line' },
  k = { 'gk', 'Move up a line' },

  -- Window stuff
  s = {
    h = { ':split<cr>', 'Split current pane horizontally' },
    v = { ':vs<cr>', 'Split current pane vertically' },
    t = { ':tab split<cr>', 'Open current pane into tab' },
  },

  -- Inspired by T-Pope's Unimpaired
  ['['] = {
    a = { ':ALEPreviousWrap<cr>', 'ALE Previous wrap' },
    b = { ':bprev<cr>', 'Previous buffer' },
    t = { ':tabp<cr>', 'Previous tab' },
  },
  [']'] = {
    a = { ':ALENextWrap<cr>', 'ALE Next wrap' },
    b = { ':bnext<cr>', 'Next buffer' },
    t = { ':tabn<cr>', 'Next tab' },
  },
})


wk.register({
  name = 'insert mode stuff',
  ['<c-'] = {
    ['-e>'] = { '<c-[>', 'Exit insert mode' },
    ['-c>'] = { '<c-[>', 'Exit insert mode' },
  },
}, { mode = 'i' })


wk.register({
  name = 'visual mode stuff',
  ['//'] = { 'y/<c-r>"<cr>', 'Search for visual selection' },
}, { mode = 'v' })
