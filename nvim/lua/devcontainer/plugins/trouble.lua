 return {
     {
         "folke/trouble.nvim",
         config = function()
             require("trouble").setup({
                 icons = {
                     indent = {
                         top = "| ",
                         middle = "|-",
                         last = "`-",
                         fold_open = "v ",
                         fold_closed = "> ",
                         ws = "  ",
                     },
                     folder_closed = "> ",
                     folder_open = "v ",
                     kinds = {
                         Error = "E ",
                         Warning = "W ",
                         Hint = "H ",
                         Information = "I ",
                     },
                 },
             })

             vim.keymap.set("n", "<leader>tt", function()
                 require("trouble").toggle("diagnostics")
             end)

             vim.keymap.set("n", "[t", function()
                 require("trouble").next({ jump = true });
             end)

             vim.keymap.set("n", "]t", function()
                 require("trouble").prev({ jump = true });
             end)

         end
     },
 }

