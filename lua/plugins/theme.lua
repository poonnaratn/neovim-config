return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Setup monokai-pro first
      require("monokai-pro").setup({})

      -- Apply full monokai-pro colorscheme to get authentic syntax highlighting
      vim.cmd.colorscheme("monokai-pro")

      local function apply_tty_overrides()
        -- Override UI elements to get TTY appearance while keeping monokai syntax
        local tty_ui_overrides = {
          Normal = { bg = "NONE", fg = "NONE" },
          NormalNC = { bg = "NONE", fg = "NONE" },
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE" },
          StatusLine = { bg = "NONE", fg = "NONE" },
          StatusLineNC = { bg = "NONE", fg = "NONE" },
          TabLine = { bg = "NONE", fg = "NONE" },
          TabLineFill = { bg = "NONE" },
          TabLineSel = { bg = "NONE", fg = "NONE" },
          VertSplit = { bg = "NONE", fg = "NONE" },
          WinSeparator = { bg = "NONE", fg = "NONE" },
          SignColumn = { bg = "NONE" },
          LineNr = { bg = "NONE", fg = "NONE" },
          CursorLineNr = { bg = "NONE", fg = "NONE" },
          Pmenu = { bg = "NONE", fg = "NONE" },
          PmenuSel = { bg = "NONE", fg = "NONE" },
          PmenuSbar = { bg = "NONE" },
          PmenuThumb = { bg = "NONE" },
          ColorColumn = { bg = "NONE" },
          CursorLine = { bg = "NONE" },
          CursorColumn = { bg = "NONE" },
          Folded = { bg = "NONE", fg = "NONE" },
          FoldColumn = { bg = "NONE", fg = "NONE" },
          EndOfBuffer = { bg = "NONE", fg = "NONE" },
          -- Which-key and plugin popup backgrounds
          WhichKey = { bg = "NONE" },
          WhichKeyNormal = { bg = "NONE" },
          WhichKeyBorder = { bg = "NONE" },
          WhichKeyDesc = { bg = "NONE" },
          WhichKeyGroup = { bg = "NONE" },
          WhichKeySeperator = { bg = "NONE" },
          -- LazyVim dashboard/landing page (from your debug output)
          LazyButton = { bg = "NONE" },
          LazyButtonActive = { bg = "NONE" },
          LazyComment = { bg = "NONE" },
          LazyDir = { bg = "NONE" },
          LazyH1 = { bg = "NONE" },
          LazyH2 = { bg = "NONE" },
          LazyNormal = { bg = "NONE" },
          LazyProgressDone = { bg = "NONE" },
          LazyProgressTodo = { bg = "NONE" },
          LazyProp = { bg = "NONE" },
          LazyReasonCmd = { bg = "NONE" },
          LazyReasonStart = { bg = "NONE" },
          LazySpecial = { bg = "NONE" },
          LazyUrl = { bg = "NONE" },
        }

        -- Apply TTY UI overrides
        for group, colors in pairs(tty_ui_overrides) do
          vim.api.nvim_set_hl(0, group, colors)
        end
      end

      -- Apply overrides on VimEnter and also when colorscheme changes
      vim.api.nvim_create_autocmd("VimEnter", { callback = apply_tty_overrides })
      vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_tty_overrides })
      vim.api.nvim_create_autocmd("BufWinEnter", { callback = apply_tty_overrides })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
