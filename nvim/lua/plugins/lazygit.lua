return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>gg",
      function()
        if vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) ~= "" then
          vim.cmd("LazyGitCurrentFile")
        else
          vim.cmd("LazyGit")
        end
      end,
      desc = "Open LazyGit",
    },
  },
}
