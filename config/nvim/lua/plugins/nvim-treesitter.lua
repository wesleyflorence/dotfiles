return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- Auto-update parsers when plugin updates
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Auto-install parsers for these languages
      ensure_installed = {
        "lua",
        "python",
        "typescript",
        "javascript",
        "tsx",
        "json",
        "yaml",
        "html",
        "css",
        "bash",
        "go",
        "java",
        "kotlin",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
      },
      auto_install = true, -- Auto-install parsers when opening files
      sync_install = false,
      ignore_install = { "phpdoc", "erlang", "org" },

      autopairs = {
        enable = true,
      },

      highlight = {
        enable = true,
        disable = {}, -- Disable for specific languages if needed
        additional_vim_regex_highlighting = false, -- Set to false for better performance
      },

      indent = {
        enable = true,
        disable = { "yaml" },
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
    })
  end,
}
