-- return {
--   "projekt0n/github-nvim-theme",
--   config = function()
--     require('github-theme').setup({
--       options = {
--         theme_style = "dark_default",
--         transparent = true,
--         sidebars = {"qf", "vista_kind", "terminal", "packer"},
--       }
--     })
--     vim.cmd('colorscheme github_dark')
--   end,
--   priority = 1000
-- }

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = function ()
    local gruvbox = require 'gruvbox'
      gruvbox.setup {
        transparent_mode = true,
        -- palette_overrides = {
        --   bright_green = "#fe8019",
        --   bright_orange = "#b8bb26"
        -- }
    }

    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
  end
}
