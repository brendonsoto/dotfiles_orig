local hop = require('hop')
local hopHint = require('hop.hint')

-- A module to expose keymappings related to hop
-- This way, less require('hop') etc and
-- hopefully easier to delete, if needed

local M = {
    keymappings = {
        f = {
            function()
                hop.hint_char1({direction = hopHint.HintDirection.AFTER_CURSOR})
            end, 'Hop forward'
        },
        F = {
            function()
                hop.hint_char1({direction = hopHint.HintDirection.BEFORE_CURSOR})
            end, 'Hop Backwards'
        },
        j = {
            function()
                hop.hint_lines_skip_whitespace({
                    direction = hopHint.HintDirection.AFTER_CURSOR
                })
            end, 'Hop down'
        },
        k = {
            function()
                hop.hint_lines_skip_whitespace({
                    direction = hopHint.HintDirection.BEFORE_CURSOR
                })
            end, 'Hop up'
        }
    }
}

return M
