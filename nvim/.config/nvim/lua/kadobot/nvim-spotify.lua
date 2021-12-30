local wk = require('which-key')

wk.register({
    name = "Spotify",
    ['n'] = { "<Plug>(SpotifySkip)", "Skip" },
    ['s'] = { "<Plug>(SpotifySave)", "Save" },
    ['p'] = { "<Plug>(SpotifyPause)", "Pause" },
    ['o'] = { ":Spotify<CR>", "Open" },
    ['d'] = { ":SpotifyDevices<CR>", "Devices" },
}, { prefix = "<leader>s" })

