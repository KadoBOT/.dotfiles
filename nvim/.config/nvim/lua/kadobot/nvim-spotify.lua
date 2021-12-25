local wk = require('which-key')
local spotify = require'nvim-spotify'

wk.register({
    name = "Spotify",
    ['n'] = { "<Plug>(SpotifySkip)", "Skip" },
    ['s'] = { "<Plug>(SpotifySave)", "Save" },
    ['p'] = { "<Plug>(SpotifyPause)", "Pause" },
    ['o'] = { ":Spotify<CR>", "Open" },
}, { prefix = "<leader>s" })

spotify.setup {
    refresh_token = "AQDabgiJQ4VegnwJjhaw57woPVzdBOMeJTWq0xkTpQbBqpDBDLv2Yi_RzeEsfmm_1sXctOKufyUQxh8zN-0KOVIegQPZzMkhUeD2Cg6CON04ObU768iR2rYWeTcfNKaAnPg"
}
