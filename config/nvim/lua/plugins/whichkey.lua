return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    icons = {
      breadcrumb = "»",
      separator = ">",
      group = "+",
    },
    win = {
      border = "rounded",
    },
  },
  keys = {
    { "<leader>b", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Buffers" },
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer" },
    { "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>H", "<cmd>Alpha<cr>", desc = "Home Dashboard" },
    { "<leader>j", "<cmd>e ~/vault/jrn/" .. os.date "%Y.%m.%d" .. ".md<cr>", desc = "jrn today" },
    { "<leader><leader>", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false, find_command = {'rg', '--files', '--hidden', '-g', '!.git'}})<cr>", desc = "Find Files in Project" },
    { "<leader>/", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text" },
    { "<leader>?", "<cmd>Telescope live_grep_args theme=ivy<cr>", desc = "Find Text with Args" },
    { "<leader>.", "<cmd>Telescope file_browser<cr>", desc = "Find File" },
    { "<leader>p", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects" },
    { "<leader>n", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/org'})<cr>", desc = "Org Notes" },
    { "<leader>v", "<cmd>lua require('telescope.builtin').find_files({cwd = '~/vault'})<cr>", desc = "Vault" },
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
    
    -- Git mappings
    { "<leader>gg", "<cmd>lua require 'neogit'.open()<CR>", desc = "Neogit" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
    { "<leader>gz", "<cmd>Telescope git_stash<cr>", desc = "Apply stash" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff" },
    { "<leader>gw", "<cmd>:execute ':!git-open --suffix " .. "(git ls-files --full-name %)\\#L' . line('.')<cr>", desc = "Web Browse Remote" },
    { "<leader>gW", "<cmd>:execute ':!git-open --board --suffix " .. "(git ls-files --full-name %)\\#L' . line('.')<cr>", desc = "Copy Web Browse Remote URL" },

    -- Debug mappings
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Breakpoint" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Into" },
    { "<leader>ds", "<cmd>lua require'dap'.step_over()<cr>", desc = "Over" },
    { "<leader>do", "<cmd>lua require'dap'.step_out()<cr>", desc = "Out" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Repl" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", desc = "Last" },
    { "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", desc = "UI" },
    { "<leader>dx", "<cmd>lua require'dap'.terminate()<cr>", desc = "Exit" },

    -- LSP mappings
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>ld", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
    { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Info" },
    { "<leader>lh", "<cmd>lua require('lsp-inlayhints').toggle()<cr>", desc = "Toggle Hints" },
    { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>", desc = "Next Diagnostic" },
    { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "Prev Diagnostic" },
    { "<leader>lv", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Virtual Text" },
    { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
    { "<leader>lo", "<cmd>SymbolsOutline<cr>", desc = "Outline" },
    { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
    { "<leader>lt", "<cmd>:Telescope lsp_type_definitions<cr>", desc = "Type Definitions" },

    -- Search mappings
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Search Buffer" },

    -- Modify mappings
    { "<leader>mw", "<cmd>:set wrap!<cr>", desc = "Toggle Wrap" },
    { "<leader>mp", "<cmd>:echo expand('%p')<cr>", desc = "Full Path" },
    { "<leader>ms", "<cmd>:put =strftime('# %Y.%m.%d')<cr>", desc = "Timestamp" },
    { "<leader>mc", "<cmd>:lua require('cmp').setup.buffer { enabled = false }<cr>", desc = "Disable Autocomplete" },
    { "<leader>mC", "<cmd>:lua require('cmp').setup.buffer { enabled = true }<cr>", desc = "Enable Autocomplete" },

    -- Visual mode mappings
    { "<leader>r", "<cmd>lua require('iron.core').visual_send()<cr>", mode = "v", desc = "Send Python Selection" },
  },
  init = function()
    local wk = require("which-key")
    wk.add {
      { "<leader>g", group = "git" },
      { "<leader>d", group = "debug" },
      { "<leader>l", group = "lsp" },
      { "<leader>s", group = "search" },
      { "<leader>m", group = "mod" },
    }
  end,
}
