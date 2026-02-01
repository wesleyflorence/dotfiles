return {
  "projekt0n/github-nvim-theme",
  priority = 1000,
  config = function()
    require('github-theme').setup({
      options = {
        transparent = true,
      }
    })
    vim.cmd('colorscheme github_dark')
  end,
}

-- Gruvbox (commented out)
-- return {
--   "ellisonleao/gruvbox.nvim",
--   priority = 1000,
--   config = function ()
--     local gruvbox = require 'gruvbox'
--       gruvbox.setup {
--         transparent_mode = true,
--         -- palette_overrides = {
--         --   bright_green = "#fe8019",
--         --   bright_orange = "#b8bb26"
--         -- }
--     }
--
--     vim.o.background = "dark"
--     vim.cmd([[colorscheme gruvbox]])
--   end
-- }
