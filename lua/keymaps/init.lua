-- Copy to system clipboard in normal and visual mode
vim.keymap.set({'n','v'}, '<C-c>', 'y', { noremap = true })

-- Cut to system clipboard in normal and visual mode
vim.keymap.set({'n','v'}, '<C-x>', 'd', { noremap = true })

-- Paste from system clipboard
vim.keymap.set({'n','v'}, '<C-v>', 'p', { noremap = true })

--saving
vim.keymap.set({'n','i'}, '<C-s>', '<esc>:w<cr>i', { noremap = true })
-- undo
vim.keymap.set({'n','i'}, '<C-z>', '<esc>ui', { noremap = true })
-- redo
vim.keymap.set({'n','i'}, '<C-y>', '<esc><C-r>i', { noremap = true })


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
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)