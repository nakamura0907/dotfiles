local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
        end,
    },
    {
        'nvim-telescope/telescope-frecency.nvim',
        config = function()
            require("telescope").load_extension "frecency"
            keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)
        end,
    }
}
