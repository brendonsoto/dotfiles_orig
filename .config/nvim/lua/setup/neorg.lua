require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.concealer"] = {}
  },
  logger = {
    -- Should print the output to neovim while running
    use_console = true,

    -- Should highlighting be used in console (using echohl)
    highlights = true,

    -- Should write to a file
    use_file = true,

    -- Any messages above this level will be logged.
    level = "warn",

    -- Level configuration
    modes = {
      { name = "trace", hl = "Comment", },
      { name = "debug", hl = "Comment", },
      { name = "info",  hl = "None", },
      { name = "warn",  hl = "WarningMsg", },
      { name = "error", hl = "ErrorMsg", },
      { name = "fatal", hl = "ErrorMsg", },
    },

    -- Can limit the number of decimals displayed for floats
    float_precision = 0.01,
  },
}
