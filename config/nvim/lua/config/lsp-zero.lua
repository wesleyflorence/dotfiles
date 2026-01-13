local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  local opts = {buffer = bufnr}
  vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
  vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  -- vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  -- vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
  -- vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})


require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "gopls",
    "cssls",
	  "tailwindcss",
    "cssmodules_ls",
    "emmet_ls", -- web
    "html",
    "jsonls",
    "jdtls",
    -- "groovyls", -- Mason installation broken, install manually if needed
    "lua_ls",
    "tflint",
    "terraformls",
    "ts_ls", -- TypeScript/JavaScript (replaced tsserver)
    "pyright",
    "ruff",
    "yamlls",
    "bashls",
    "clangd",
    "lemminx", --xml
    "eslint",
    "kotlin_language_server",
    "templ",
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    jdtls = function() end, -- Use jdtls

    -- Use venv
    pyright = function()
      require('lspconfig').pyright.setup({
        before_init = function(_, config)
          local path = vim.fn.getcwd() .. '/.venv/bin/python'
          if vim.fn.filereadable(path) == 1 then
            config.settings.python.pythonPath = path
          end
        end,
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = 'workspace',
            },
          },
        },
      })
    end,
  }
})

local cmp = require('cmp')
-- require('copilot_cmp').setup({})
local lspkind = require("lspkind")

cmp.setup({
  sources = {
    { name = "copilot", group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
  },
  snippet = {
    expand = function(args)
      -- You need Neovim v0.10 to use vim.snippet
      vim.snippet.expand(args.body)
    end,
  },
formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      max_width = 50,
      symbol_map = { Copilot = "" }
    })
  },
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion, Apparently `C-y` is canoncial vim, might try later
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Back to tab, maybe try `C-n` and `C-p` Later
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item()
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }
})
