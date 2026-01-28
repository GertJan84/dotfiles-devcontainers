return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local treesitter = require("nvim-treesitter")
        local ensure_installed = {""} 

        treesitter.setup()
        treesitter.install(ensure_installed)

        vim.api.nvim_create_autocmd('FileType', {
            pattern = ensure_installed,
            callback = function()
                vim.treesitter.start()
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
