-- Copy to system clipboard in normal and visual mode
vim.keymap.set({'n','v'}, '<C-c>', 'y', { noremap = true })

-- Copy to system clipboard in normal and visual mode
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<C-c>', '"+y', { noremap = true, desc = 'MacOS copy' })

-- Paste from system clipboard
vim.keymap.set({'n','v'}, '<C-v>', 'p', { noremap = true })

--saving
vim.keymap.set({'n','i'}, '<C-s>', '<esc>:w<cr>i', { noremap = true })
-- undo
vim.keymap.set({'n','i'}, '<C-z>', '<esc>ui', { noremap = true })
-- redo
vim.keymap.set({'n','i'}, '<C-y>', '<esc><C-r>i', { noremap = true })


----------------------------------------------------------------------
--MacOS specific binds
----------------------------------------------------------------------

--saving
vim.keymap.set({'n','i'}, '<D-s>', '<esc>:w<cr>i', { noremap = true })
-- undo
vim.keymap.set({'n','i'}, '<D-z>', '<esc>ui', { noremap = true })
-- redo
vim.keymap.set({'n','i'}, '<D-y>', '<esc><C-r>i', { noremap = true })
-- Copy to system clipboard in normal and visual mode
vim.keymap.set({ 'n', 'i', 'v', 'x' }, '<D-c>', '"+y', { noremap = true, desc = 'MacOS copy' })
-- Cut to system clipboard in normal and visual mode
vim.keymap.set({'n','v'}, '<D-x>', 'd', { noremap = true })


----------------------------------------------------------------------
-- navigation keymaps
----------------------------------------------------------------------
vim.keymap.set({'n', 'i'}, "<A-h>", "<C-w>h")
vim.keymap.set({'n', 'i'}, "<A-j>", "<C-w>j")
vim.keymap.set({'n', 'i'}, "<A-k>", "<C-w>k", {noremap = true})
vim.keymap.set({'n', 'i'}, "<A-l>", "<C-w>l")

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {desc = "find files"})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {desc = "grep"})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {desc = "buffers"})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {desc = "help_tags"})

----------------------------------------------------------------------
-- harpoon keymaps
----------------------------------------------------------------------

local harpoon = require("harpoon")
harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "[harpoon] toggle menu"})

vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end)
vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-p>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<A-n>", function() harpoon:list():next() end)
