vim.cmd("set expandtab")
vim.cmd("set number")
vim.cmd("inoremap ^S <cmd>:w<cr>")
vim.g.mapleader = " "
vim.opt.clipboard = 'unnamedplus'
--setting up copying
-- Copy to system clipboard in normal and visual mode
vim.keymap.set({'n','v'}, '<C-c>', 'y', { noremap = true })

-- Cut to system clipboard in normal and visual mode
vim.keymap.set({'n','v'}, '<C-x>', 'd', { noremap = true })

-- Paste from system clipboard
vim.keymap.set({'n','v'}, '<C-v>', 'p', { noremap = true })

--saving
--vim.keymap.set({'n','i'}, '<C-s>', '<esc>:w<cr>i', { noremap = true })

--undo
--vim.keymap.set({'n','i'}, '<C-z>', '<esc>ui', { noremap = true })
--redo
--vim.keymap.set({'n','i'}, '<C-y>', '<esc><C-r>i', { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
        {'nvim-treesitter/nvim-treesitter',build=':TSUpdate'},
        {'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
        {'NLKNguyen/papercolor-theme'},
        {"folke/which-key.nvim",event = "VeryLazy",
                keys = {{
                        "<leader>?",
                        function()
                                require("which-key").show({ global = false })
                        end,
                        desc = "Buffer Local Keymaps (which-key)",
                }},
        },
        {'preservim/nerdtree'},
}
local opts = {}

-- configuring plugins
require("lazy").setup(plugins,opts)
require("nvim-treesitter.configs").setup({
        ensure_installed = {"lua","c","cpp","rust","python"},
        highlight = {enable = true},
        indent = {enable = true}
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "find files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = "grep"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "buffers"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "help_tags"})

vim.cmd("colorscheme habamax")

--nerdtree configs
vim.keymap.set('n','<leader>n',':NERDTreeFocus<CR>',{noremap = true, desc = "focus nerd tree"})
vim.keymap.set('n','<C-n>',':NERDTree<CR>',{noremap = true, desc = "focus nerd tree"})
vim.keymap.set('n','<C-b>',':NERDTreeToggle<CR>',{noremap = true, desc = "focus nerd tree"})
vim.keymap.set('n','<C-f>',':NERDTreeFind<CR>',{noremap = true, desc = "focus nerd tree"})
vim.cmd('autocmd StdinReadPre * let s:std_in=1')
vim.cmd('autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists(\'s:std_in\') | execute \'NERDTree\' argv()[0] | wincmd p | enew | execute \'cd \'.argv()[0] | endif')
vim.cmd('autocmd BufEnter * if tabpagenr(\'$\') == 1 && winnr(\'$\') == 1 && exists(\'b:NERDTree\') && b:NERDTree.isTabTree() | call feedkeys(\":quit\\<CR>\") | endif')
