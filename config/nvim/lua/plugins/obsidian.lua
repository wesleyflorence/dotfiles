return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "vault",
        path = "~/vault",
      },
    },
    templates = {
      folder = "templates",
    },
    daily_notes = {
      folder = "jrn",
      -- date_format = "%Y.%m.%d",
      template = "JrnTemplate.md"
    },
  }
}
