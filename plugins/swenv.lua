return {
    "AckslD/swenv.nvim",
    config = function()
        get_envs = function(venvs_path)
            return require("swenv.api").get_envs(venvs_path)
        end
        venv_path = vim.fn.expand("~/.venvs")
        post_set_venv = function()
            vim.cmd([[:LspRestart]])
        end
        vim.api.nvim_command("FileType", {
            pattern = "python",
            callback = function()
                require("swenv.api").auto_venv()
            end,
        })
    end,
}
