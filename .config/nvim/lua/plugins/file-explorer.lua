return {
    {
        'lambdalisue/fern.vim',
        config = function()
            -- vim.g["fern#renderer"] = "nerdfont"
            vim.g["fern#default_hidden"] = 1
            vim.api.nvim_set_keymap("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle<CR>", { noremap = true, silent = true })
        end
    },
    -- fern_renderer_nerdfont.vim, line 6: Vim(call):E121: Undefined variable: g:fern#renderers
    -- {
    --     'lambdalisue/fern-renderer-nerdfont.vim',
    --     dependencies = {
    --         'lambdalisue/nerdfont.vim'
    --     },
    --     config = function()
    --         vim.g["fern#renderer"] = "nerdfont"
    --     end
    -- }
}