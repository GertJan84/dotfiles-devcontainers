return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                // rust = { "clippy" }
            },
            default_format_opts = {
                timeout_ms = 3000,
            }
        })
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                vim.bo[args.buf].formatexpr = "v:lua.require'conform'.formatexpr()"
            end,
        })
    end
}

