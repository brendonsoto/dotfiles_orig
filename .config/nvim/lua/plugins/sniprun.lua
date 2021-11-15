local M = {
  keymappings = {
    normal = {
      s = {
        c = {
          '<Plug>SnipClose',
          'Close SnipRun displays'
        },
        r = {
          '<Plug>SnipRun',
          'Run line of code'
        },
      }
    },
    visual = {
      s = {
        r = {
          '<Plug>SnipRun',
          'Run block of code'
        }
      }
    }
  }
}

return M
