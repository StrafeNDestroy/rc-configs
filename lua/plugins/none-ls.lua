return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.shellcheck,
        null_ls.builtins.formatting.cmakelang,
        null_ls.builtins.formatting.cpplint,
        null_ls.builtins.formatting.pylint,
        null_ls.builtins.formatting.selene,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.diagnostics.cmakelang,
        null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.diagnostics.pylint,
      }
    })
    vim.keymap.set("n", "<Leader>gf", vim.lsp.buf.format, {})
  end
}

