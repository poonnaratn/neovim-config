return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Apply default colorscheme first (keeps TTY look)
      vim.cmd.colorscheme("default")

      -- Setup monokai-pro
      require("monokai-pro").setup({})

      -- Use VimEnter to apply syntax colors after everything loads
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- Keep default colorscheme for TTY look (no termguicolors needed)
          vim.cmd.colorscheme("default")

          -- Get monokai-pro color palette to map to terminal colors
          local Colorscheme = require("monokai-pro.colorscheme")
          local palette = Colorscheme("pro") -- Use "pro" variant of monokai

          -- Map monokai colors to terminal color indices for TTY compatibility
          -- This preserves TTY look while approximating monokai colors
          local syntax_colors = {
            Comment = { ctermfg = 8 }, -- gray (monokai dimmed3)
            String = { ctermfg = 11 }, -- bright yellow (monokai accent3)
            Character = { ctermfg = 13 }, -- bright magenta (monokai accent6)
            Number = { ctermfg = 13 }, -- bright magenta (monokai accent6)
            Boolean = { ctermfg = 13 }, -- bright magenta (monokai accent6)
            Float = { ctermfg = 13 }, -- bright magenta (monokai accent6)
            Constant = { ctermfg = 13 }, -- bright magenta (monokai accent6)
            Function = { ctermfg = 10 }, -- bright green (monokai accent4)
            Keyword = { ctermfg = 9 }, -- bright red (monokai accent1)
            Conditional = { ctermfg = 9 }, -- bright red (monokai accent1)
            Repeat = { ctermfg = 9 }, -- bright red (monokai accent1)
            Operator = { ctermfg = 9 }, -- bright red (monokai accent1)
            Type = { ctermfg = 14 }, -- bright cyan (monokai accent5)
            PreProc = { ctermfg = 11 }, -- bright yellow (monokai accent3)
          }

          -- Apply the terminal color syntax highlighting
          for group, color in pairs(syntax_colors) do
            vim.api.nvim_set_hl(0, group, color)
          end
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "default",
    },
  },
}
