-- Optional: Auto-install formatters via Mason if not found in system
-- This is a backup if Homebrew packages aren't installed
return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    ensure_installed = {
      -- Formatters (stylua via Homebrew, not Mason)
      "shfmt",           -- Shell
      "prettier",        -- JS/TS/JSON/HTML/CSS/YAML/Markdown
      "google-java-format", -- Java
      "ruff",            -- Python (linter + formatter)
      -- Note: goimports and gofmt come with Go itself, not via Mason
      -- Note: stylua installed via Homebrew to avoid conflicts
    },
    auto_update = false,
    run_on_start = true,  -- Install missing tools on startup
  },
}
