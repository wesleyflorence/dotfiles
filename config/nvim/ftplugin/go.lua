local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Get current buffer for buffer-local mappings
local buf = vim.api.nvim_get_current_buf()

-- Register Go mappings using new which-key v3 format
which_key.add({
  { "<leader>r", group = "GoLang", buffer = buf },
  { "<leader>ra", "<Cmd>GoAddTest<CR>", desc = "GoAddTest", buffer = buf },
  { "<leader>re", "<Cmd>GoIfErr<CR>", desc = "GoIfErr", buffer = buf },
  { "<leader>rf", "<Cmd>GoFormat<CR>", desc = "GoFormat", buffer = buf },
  { "<leader>rg", "<Cmd>GoGet<CR>", desc = "GoGet", buffer = buf },
  { "<leader>rt", "<Cmd>GoTest<CR>", desc = "GoTest", buffer = buf },
})

-- Golang prefers tabs and 4 spaces
local vim_options = {
  expandtab = false,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
}

for k, v in pairs(vim_options) do
  vim.opt[k] = v
end
