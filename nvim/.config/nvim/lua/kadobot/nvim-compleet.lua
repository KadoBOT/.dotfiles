local compleet = require('compleet')
local keymap = vim.keymap

compleet.setup({
  ui = {
    menu = {
      -- Where to anchor the completion menu, either "cursor" or "match".
      anchor = "cursor",

      -- Whether to automatically show the menu every time there are
      -- completions available.
      autoshow = true,

      -- The maximum height (in rows) of the completion menu.
      max_height = nil,

      border = {
        -- Whether to add a border to the completion menu's floating window.
        enable = false,

        -- Any of the style formats listed in `:h nvim_open_win`.
        style = "single"
      },
    },

    details = {
      border = {
        -- Whether to add a border to the details's floating window.
        enable = true,

        -- Same as `ui.menu.border.style`.
        style = {
          "",
          "",
          "",
          {" ", "CompleetDetails"},
        }
      },
    },

    hint = {
      -- Whether to show completion hints.
      enable = false,
    }
  },

  completion = {
    -- Whether to enable completion while deleting characters.
    while_deleting = false,
  },

  sources = {
    lipsum = {
      enable = false,
    },
  }
})

local tab = function()
  return
    (compleet.is_menu_visible() and "<Plug>(compleet-next-completion)")
    or (compleet.has_completions() and "<Plug>(compleet-show-completions)")
    or "<Tab>"
end

local s_tab = function()
  return
    compleet.is_menu_visible()
    and "<Plug>(compleet-prev-completion)"
     or "<S-Tab>"
end

local right = function()
  return
    compleet.is_hint_visible()
    and "<Plug>(compleet-insert-hinted-completion)"
     or "<Right>"
end

local cr = function()
  return
    compleet.is_completion_selected()
    and "<Plug>(compleet-insert-selected-completion)"
     or "<CR>"
end

local opts = { expr = true, remap = true }

keymap.set("i", "<Tab>", tab, opts)
keymap.set("i", "<S-Tab>", s_tab, opts)
keymap.set("i", "<Right>", right, opts)
keymap.set("i", "<CR>", cr, opts)
keymap.set("i", "<C-S>", tab, opts)
