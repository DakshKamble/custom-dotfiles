local M = {}

function M.format(bufnr)
  bufnr = bufnr == 0 and vim.api.nvim_get_current_buf() or bufnr
  local use_prettier = false
  if package.loaded["null-ls"] then
    local sources = require("null-ls.sources")
    local methods = require("null-ls.methods")
    use_prettier = #sources.get_available(vim.bo[bufnr].filetype, methods.internal.FORMATTING) > 0
  end

  vim.lsp.buf.format({
    bufnr = bufnr,
    async = false,
    timeout_ms = 5000,
    filter = function(client)
      return not use_prettier or client.name == "null-ls"
    end,
  })
end

return M
