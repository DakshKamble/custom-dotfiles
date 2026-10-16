return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      dependencies = { "mason-org/mason.nvim" },
      opts = { ensure_installed = { "prettier" } },
    },
  },
  config = function()
    local null_ls = require("null-ls")
    local format_group = vim.api.nvim_create_augroup("PrettierFormatOnSave", { clear = true })

    null_ls.setup({
      sources = { null_ls.builtins.formatting.prettier },
      on_attach = function(client, bufnr)
        if not client:supports_method("textDocument/formatting") then
          return
        end

        vim.api.nvim_clear_autocmds({ group = format_group, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = format_group,
          buffer = bufnr,
          desc = "Format with Prettier before saving",
          callback = function()
            if vim.g.prettier_format_on_save ~= false then
              require("config.format").format(bufnr)
            end
          end,
        })
      end,
    })

    vim.api.nvim_create_user_command("Format", function()
      require("config.format").format(0)
    end, { desc = "Format the current buffer" })
  end,
}
