local wk = require('which-key')
local spotify = require'nvim-spotify'

wk.register({
    name = "Spotify",
    ['n'] = { "<Plug>(SpotifySkip)", "Skip" },
    ['s'] = { "<Plug>(SpotifySave)", "Save" },
    ['p'] = { "<Plug>(SpotifyPause)", "Pause" },
    ['b'] = { "<Plug>(SpotifyPrev)", "Previous" },
    ['o'] = { ":Spotify<CR>", "Open" },
    ['d'] = { ":SpotifyDevices<CR>", "Devices" },
}, { prefix = "<leader>s" })

spotify.setup {
    status = {
        update_interval = 20000,
        format = '%s %t by %a'
    }
}
