set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" LSP

lua << EOF
-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  -- snippet = {
  --   expand = function(args)
  --     -- For `vsnip` user.
  --     vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
  --
  --     -- For `luasnip` user.
  --     -- require('luasnip').lsp_expand(args.body)
  --
  --     -- For `ultisnips` user.
  --     -- vim.fn["vsnip#anonymous"](args.body)
  --   end,
  -- },
  mapping = {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'nvim_lsp' },

    { name = 'neorg' },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
  }
})

local nvim_lsp = require('lspconfig')

local vuels_setup = {
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
        },
      javascript = {
        format = {}
        },
      stylusSupremacy = {},
      typescript = {
        format = {}
        },
      vetur = {
        completion = {
          autoImport = false,
          tagCasing = "kebab",
          useScaffoldSnippets = false
          },
        format = {
          enable = true,
          scriptInitialIndent = false,
          styleInitialIndent = false
          },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = false,
          template = true
          }
        }
      }
    }
  }

local custom_setups = {
  vuels = vuels_setup
  }


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gh', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gT', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gH', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[j', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'tsserver', 'vuels' }
for _, lsp in ipairs(servers) do
  if (lsp == 'vuels') then
    nvim_lsp[lsp].setup { on_attach = on_attach, init_options = vuels_setup.init_options }
  else
    nvim_lsp[lsp].setup { on_attach = on_attach }
  end
end


local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

require('neorg').setup {
  -- Tell Neorg what modules to load
  load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
    config = {
      workspaces = {
        my_workspace = "~/neorg"
        }
      }
    },
  ["core.norg.completion"] = {
    config = {
      engine = "nvim-cmp"
      }
    },
  },
  hook = function()
    -- This sets the leader for all Neorg keybinds. It is separate from the regular <Leader>,
    -- And allows you to shove every Neorg keybind under one "umbrella".
    local neorg_leader = "<Leader>" -- You may also want to set this to <Leader>o for "organization"

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
          { "gtd", "core.norg.qol.todo_items.todo.task_done" },
          { "gtu", "core.norg.qol.todo_items.todo.task_undone" },
          { "gtp", "core.norg.qol.todo_items.todo.task_pending" },
          { "<C-Space>", "core.norg.qol.todo_items.todo.task_cycle" }

        },
      }, { silent = true, noremap = true })

    end)
  end
}
EOF
