return {
    {
        'lambdalisue/fern.vim',
        config = function()
            vim.g["fern#renderer"] = "nerdfont"
            vim.g["fern#default_hidden"] = 1
        end
    },
    {
        'lambdalisue/fern-renderer-nerdfont.vim',
        dependencies = {
            'lambdalisue/nerdfont.vim'
        }
    }
}