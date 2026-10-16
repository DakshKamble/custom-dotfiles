return {
    {
    "mason-org/mason.nvim",
    opts = {}
},

{
"nvim-telescope/telescope-ui-select.nvim",
dependencies = {
"nvim-telescope/telescope.nvim",
},
config = function()
local telescope = require("telescope")

  telescope.load_extension("ui-select")
end,

},

}
