return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        overrides = function()
          return {
            DashboardHeader = { fg = "#F4B8C8", bold = true },
          }
        end,
        colors = {
          theme = {
            all = {
              ui = { bg_gutter = "none" },
            },
          },
        },
      })
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },
}
