local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Fuzzy Finder
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-g>", ":Telescope live_grep<CR>", opts)

-- File Explorer
keymap("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle<CR>", opts)

-- Terminal
vim.api.nvim_create_user_command("Term", function()
    vim.cmd("tabnew term://zsh")
end, {})
-- Terminal-Normal Mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- coc.nvim: autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local cocAcOpts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', cocAcOpts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], cocAcOpts)
keymap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- coc.nvim: code navigation
keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap("n", "gr", "<Plug>(coc-references)", {silent = true})

-- coc.nvim: Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keymap("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})