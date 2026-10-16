return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "hyper",
    config = {
      week_header = { enable = false },
      header = {
        "",
        " ██████╗  █████╗ ██████╗  ██████╗ ██╗",
        "██╔════╝ ██╔══██╗██╔══██╗██╔════╝ ██║",
        "██║  ███╗███████║██████╔╝██║  ███╗██║",
        "██║   ██║██╔══██║██╔══██╗██║   ██║██║",
        "╚██████╔╝██║  ██║██║  ██║╚██████╔╝██║",
        " ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝",
        "",
      },
      footer = {},
      shortcut = {
        { desc = "Files", group = "Label", key = "f", action = "Telescope find_files" },
        { desc = "Recent", group = "DiagnosticHint", key = "r", action = "Telescope oldfiles" },
        { desc = "Plugins", group = "Number", key = "p", action = "Lazy" },
        { desc = "Quit", group = "DiagnosticError", key = "q", action = "qa" },
      },
      project = { enable = true, limit = 8, action = "Telescope find_files cwd=" },
      mru = { enable = true, limit = 10 },
    },
  },
}
