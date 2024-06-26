local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Terminal
vim.api.nvim_create_user_command("Term", function()
    vim.cmd("tabnew term://zsh")
end, {})
-- Terminal-Normal Mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- Autocomplete with coc.nvim
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local cocAcOpts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

keymap("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', cocAcOpts)
keymap("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], cocAcOpts)
keymap("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Code navigation with coc.nvim
keymap("n", "gd", "<Plug>(coc-definition)", {silent = true})
keymap("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
keymap("n", "gi", "<Plug>(coc-implementation)", {silent = true})
keymap("n", "gr", "<Plug>(coc-references)", {silent = true})

-- Show documentation with coc.nvim
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
