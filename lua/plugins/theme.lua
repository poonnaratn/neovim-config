--[[
THEME CONFIGURATION: TTY + Monokai Syntax
==========================================

This configuration achieves:
✅ TTY transparent background for main editor
✅ Authentic monokai-pro syntax highlighting
✅ Semi-transparent popups (Mason, Lazy, Which-key) with white borders
✅ Fully transparent dashboard for TTY look

Approach:
1. Load full monokai-pro theme first (gets all syntax highlighting)
2. Override UI elements to be transparent (TTY look)
3. Configure Mason/Lazy with borders
4. Use winblend for popup transparency
--]]

return {
  -- Configure lualine for TTY transparency
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { bg = "NONE", fg = "#ffffff", gui = "bold" },
            b = { bg = "NONE", fg = "#ffffff" },
            c = { bg = "NONE", fg = "#ffffff" },
          },
          insert = {
            a = { bg = "NONE", fg = "#a6e22e", gui = "bold" },
            b = { bg = "NONE", fg = "#ffffff" },
            c = { bg = "NONE", fg = "#ffffff" },
          },
          visual = {
            a = { bg = "NONE", fg = "#fd971f", gui = "bold" },
            b = { bg = "NONE", fg = "#ffffff" },
            c = { bg = "NONE", fg = "#ffffff" },
          },
          replace = {
            a = { bg = "NONE", fg = "#f92672", gui = "bold" },
            b = { bg = "NONE", fg = "#ffffff" },
            c = { bg = "NONE", fg = "#ffffff" },
          },
          command = {
            a = { bg = "NONE", fg = "#ae81ff", gui = "bold" },
            b = { bg = "NONE", fg = "#ffffff" },
            c = { bg = "NONE", fg = "#ffffff" },
          },
          inactive = {
            a = { bg = "NONE", fg = "#75715e" },
            b = { bg = "NONE", fg = "#75715e" },
            c = { bg = "NONE", fg = "#75715e" },
          },
        },
      },
    },
  },

  -- Add Mason with border configuration
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded", -- Enables white borders for Mason windows
      },
    },
  },
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
          -- Main editor - fully transparent for TTY look
          Normal = { bg = "NONE", fg = "NONE" },
          NormalNC = { bg = "NONE", fg = "NONE" },
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

          -- Popup windows - transparent with white borders
          WhichKey = { bg = "NONE" },
          WhichKeyNormal = { bg = "NONE" },
          WhichKeyBorder = { bg = "NONE", fg = "#ffffff", bold = true },
          WhichKeyDesc = { bg = "NONE" },
          WhichKeyGroup = { bg = "NONE" },
          WhichKeySeperator = { bg = "NONE", fg = "#ffffff" },

          -- Floating windows - transparent with white borders
          NormalFloat = { bg = "NONE" },
          FloatBorder = { bg = "NONE", fg = "#ffffff", bold = true },
          FloatTitle = { bg = "NONE", fg = "#ffffff", bold = true },

          -- Mason specific - transparent backgrounds
          MasonNormal = { bg = "NONE" },
          MasonHeader = { bg = "NONE" },
          MasonHeaderSecondary = { bg = "NONE" },
          MasonHighlight = { bg = "NONE" },
          MasonHighlightBlock = { bg = "NONE" },
          MasonHighlightBlockBold = { bg = "NONE" },

          -- Lazy popups - transparent backgrounds
          LazyNormal = { bg = "NONE" },

          -- LazyVim dashboard/landing page - fully transparent for TTY
          LazyButton = { bg = "NONE" },
          LazyButtonActive = { bg = "NONE" },
          LazyComment = { bg = "NONE" },
          LazyDir = { bg = "NONE" },
          LazyH1 = { bg = "NONE" },
          LazyH2 = { bg = "NONE" },
          LazyProgressDone = { bg = "NONE" },
          LazyProgressTodo = { bg = "NONE" },
          LazyProp = { bg = "NONE" },
          LazyReasonCmd = { bg = "NONE" },
          LazyReasonStart = { bg = "NONE" },
          LazySpecial = { bg = "NONE" },
          LazyUrl = { bg = "NONE" },

          -- Dashboard specific groups (Snacks.nvim dashboard)
          SnacksDashboardNormal = { bg = "NONE" },
          SnacksDashboardIcon = { bg = "NONE" },
          SnacksDashboardDesc = { bg = "NONE" },
          DashboardHeader = { bg = "NONE" },
          DashboardFooter = { bg = "NONE" },
          DashboardKey = { bg = "NONE" },
          DashboardDesc = { bg = "NONE" },
          DashboardIcon = { bg = "NONE" },

          -- Lualine specific groups - ensure transparency
          lualine_a_normal = { bg = "NONE" },
          lualine_b_normal = { bg = "NONE" },
          lualine_c_normal = { bg = "NONE" },
          lualine_a_insert = { bg = "NONE" },
          lualine_b_insert = { bg = "NONE" },
          lualine_c_insert = { bg = "NONE" },
          lualine_a_visual = { bg = "NONE" },
          lualine_b_visual = { bg = "NONE" },
          lualine_c_visual = { bg = "NONE" },
          lualine_a_replace = { bg = "NONE" },
          lualine_b_replace = { bg = "NONE" },
          lualine_c_replace = { bg = "NONE" },
          lualine_a_command = { bg = "NONE" },
          lualine_b_command = { bg = "NONE" },
          lualine_c_command = { bg = "NONE" },
          lualine_a_inactive = { bg = "NONE" },
          lualine_b_inactive = { bg = "NONE" },
          lualine_c_inactive = { bg = "NONE" },

          -- Blink.cmp autocomplete - transparent with white borders
          BlinkCmpMenu = { bg = "NONE" },
          BlinkCmpMenuBorder = { bg = "NONE", fg = "#ffffff", bold = true },
          BlinkCmpMenuSelection = { bg = "NONE", fg = "#ffffff", bold = true },
          BlinkCmpDoc = { bg = "NONE" },
          BlinkCmpDocBorder = { bg = "NONE", fg = "#ffffff", bold = true },

          -- File explorer - remove folder background
          Directory = { bg = "NONE", fg = "NONE" },
        }

        -- Apply TTY UI overrides
        for group, colors in pairs(tty_ui_overrides) do
          vim.api.nvim_set_hl(0, group, colors)
        end
      end

      -- Apply overrides multiple times to ensure they stick
      vim.api.nvim_create_autocmd("VimEnter", { callback = apply_tty_overrides })
      vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_tty_overrides })
      vim.api.nvim_create_autocmd("BufWinEnter", { callback = apply_tty_overrides })

      -- Add 20% transparency to Mason and Lazy popup windows
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "mason", "lazy" },
        callback = function()
          vim.opt_local.winblend = 20 -- 80% opacity, TTY shows through
        end,
      })

      -- Add 20% transparency to which-key popup
      vim.api.nvim_create_autocmd("User", {
        pattern = "WhichKeyOpened",
        callback = function()
          if vim.api.nvim_win_is_valid(vim.g.which_key_win) then
            vim.api.nvim_win_set_option_value(vim.g.which_key_win, "winblend", 20)
          end
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
}
