return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "hrsh7th/cmp-nvim-lsp" },

    config = function()
      -- Advertise completion and snippet support before any server starts.
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      local inlay_hints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      }
      vim.lsp.config("ts_ls", {
        settings = {
          typescript = { inlayHints = vim.deepcopy(inlay_hints) },
          javascript = { inlayHints = vim.deepcopy(inlay_hints) },
        },
      })
      vim.lsp.config("lua_ls", {
        settings = { Lua = { hint = { enable = true } } },
      })

      -- LSP keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local opts = { buffer = event.buf, silent = true }
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method("textDocument/inlayHint", event.buf) then
            vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
          end

          -- Navigation
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

          -- Documentation
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

          -- Code actions
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          -- Diagnostics
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

          -- Format current buffer
          vim.keymap.set("n", "<leader>f", function()
            require("config.format").format(event.buf)
          end, vim.tbl_extend("force", opts, { desc = "Format current buffer" }))
        end,
      })

      -- Diagnostics appearance
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
      })

      -- Enable language servers (Neovim 0.11+)
      vim.lsp.enable({
        "lua_ls",
        "pyright",
        "clangd",
        "bashls",
        "jsonls",
        "yamlls",
        "html",
        "cssls",
        "ts_ls",
        "rust_analyzer",
      })
    end,
  },
}
