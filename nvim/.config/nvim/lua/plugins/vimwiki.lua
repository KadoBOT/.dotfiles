return {
  { "vimwiki/vimwiki" },
  {
    "michal-h21/vim-zettel",
    dependencies = {
      "vimwiki/vimwiki",
      "junegunn/fzf",
      "junegunn/fzf.vim",
    },
    config = function()
      local wk = require("which-key")
      wk.register({
        name = "Zettel",
        n = { ":ZettelNew<cr>", "New" },
        o = { ":ZettelOpen<cr>", "Open" },
        i = { ":ZettelInsertNote<cr>", "Insert Note" },
        c = { ":ZettelCapture<cr>", "Capture" },
        b = { ":ZettelSelectBuffer<cr>", "Select Buffer" },
        g = {
          name = "Generate",
          l = { ":ZettelGenerateLinks<cr>", "Links" },
          t = { ":ZettelGenerateTags<cr>", "Tags" },
        },
        ["/"] = { ":ZettelSearch<cr>", "Search" },
      }, { prefix = "<leader>z", mode = "n" })

      wk.register({
        n = { "<Plug>ZettelNewSelectedMap", "New Zettel" },
        t = { "<Plug>ZettelTitleSelectedMap", "Select Note" },
      }, { mode = "v", prefix = "<leader>z" })

      local api = vim.api

      api.nvim_command("augroup zettel")
      api.nvim_command("autocmd!")
      api.nvim_command("autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap")
      api.nvim_command("augroup END")

      vim.g.zettel_default_mappings = false
    end,
  },
}
