return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
          dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
            require("telescope").load_extension "frecency"
        end,
    }
}
