local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Get current buffer for buffer-local mappings
local buf = vim.api.nvim_get_current_buf()

-- Register Python REPL mappings using new which-key v3 format
which_key.add({
  { "<leader>r", group = "Python Repl", buffer = buf },
  { "<leader>rb", "<cmd>lua require('iron.core').send_file()<cr>", desc = "Send Python Buffer", buffer = buf },
  { "<leader>rc", "<cmd>lua require('iron.core').send_motion({'j'})<cr>", desc = "Send Jupyter Cell", buffer = buf },
})

