require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp"
      }
    },
    ["core.norg.concealer"] = {
      config = {
        icons = {
          todo = {
            enabled = true,

            done = {
              enabled = true,
              icon = ""
            },
            pending = {
              enabled = true,
              icon = ""
            },
            undone = {
              enabled = true,
              icon = ""
            },
          },
          heading = {
            enabled = true,

            level_1 = {
              enabled = true,
              icon = "",
              -- pattern = "^(%s*)%*%*%*%*%*%s+",
              -- whitespace_index = 1,
              -- highlight = "TSBoolean",
              -- padding_before = 4,
            },

            level_2 = {
              enabled = true,
              icon = " ",
            },

            level_3 = {
              enabled = true,
              icon = "  ",
            },

            level_4 = {
              enabled = true,
              icon = "   ",
            },

            level_5 = {
              enabled = true,
              icon = "    ",
              -- pattern = "^(%s*)%*%*%*%*%*%s+",
              -- whitespace_index = 1,
              -- highlight = "TSBoolean",
              -- padding_before = 4,
            },

            level_6 = {
              enabled = true,
              icon = "     ",
            },
          },
          marker = {
            enabled = true,
            icon = "",
          },
        },
        conceals = {
          url = true,
          bold = true,
          italic = true,
          underline = true,
          strikethrough = true,
          verbatim = true,
          trailing = true,
          link = true,
        },
      },
    },
    ["core.norg.dirman"] = {
      config = {
        -- TODO: Can I use an environment var for this too?
        workspaces = {
          work = "~/neorg-work",
          zettle = "~/dotfiles/meine_zettlekasten",
        }
      }
    },
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
  hook = function()
    -- Require the user callbacks module, which allows us to tap into the core of Neorg
    local neorg_callbacks = require('neorg.callbacks')

    -- Listen for the enable_keybinds event, which signals a "ready" state meaning we can bind keys.
    -- This hook will be called several times, e.g. whenever the Neorg Mode changes or an event that
    -- needs to reevaluate all the bound keys is invoked
    neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)

      -- Map all the below keybinds only when the "norg" mode is active
      keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode

        -- Keys for managing TODO items and setting their states
        { "td", "core.norg.qol.todo_items.todo.task_done" },
        { "tu", "core.norg.qol.todo_items.todo.task_undone" },
        { "tp", "core.norg.qol.todo_items.todo.task_pending" },
        -- { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }

      },
    }, { silent = true, noremap = true })

  end)
end
}
