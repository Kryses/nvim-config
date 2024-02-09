
return {
   "epwalsh/obsidian.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    ft = "markdown",
    opts = {
        workspaces = {
            {
                name = "krys-brain",
                path = "~/krys-brain",
            }
        }
    },
    config = function(opts)
        require("obsidian").setup(opts)
    end
}
