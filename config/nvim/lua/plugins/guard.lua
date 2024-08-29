return {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
        "nvimdev/guard-collection",
    },
  config = function ()
    local ft = require('guard.filetype')
    ft('java'):fmt('google-java-format')
    require('guard').setup({
        fmt_on_save = false,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = false,
    })
  end
}
