return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      java = { "google-java-format" },
      go = { "goimports", "gofmt" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
  },
}
