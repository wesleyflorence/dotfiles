return {
  "projekt0n/github-nvim-theme",
  priority = 1000,
  config = function()
    require('github-theme').setup({
      options = {
        transparent = true,
      }
    })
    -- Read theme from state file
    local theme = "dark"
    local f = io.open(vim.fn.expand("~/dotfiles/themes/current"), "r")
    if f then
      theme = f:read("*l"):gsub("%s+", "")
      f:close()
    end
    vim.cmd('colorscheme ' .. (theme == "light" and "github_light" or "github_dark"))
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
