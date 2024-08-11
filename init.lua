vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number") -- Makes the files have the line numbers on the side
-- vim.cmd("set cc=80") -- Set atn 80 column border for good coding style I guess...
vim.g.mapleader = " "

-- Bootstrap lazy.nvim 
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


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim

-- require("lazy").setup(plugins)

require("lazy").setup({
  spec = {
    -- add your plugins here
      { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000 , config = true, opts = {}},
    ---------------------------------------------------------
      { "nvim-telescope/telescope.nvim", tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }}, -- This is the live file system search and grep package
    ---------------------------------------------------------
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    ---------------------------------------------------------
      { 'nvimdev/dashboard-nvim', event = 'VimEnter', 
         config = function()
            require('dashboard').setup {}
               end,
         dependencies = {{'nvim-tree/nvim-web-devicons'}}},
    --------------------------------------------------------
      { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim","nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}}
    --------------------------------------------------------
    },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})


local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "javascript", "rust"},
  highlight = { enable = true },
  indent = { enable = true }
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme eldritch]])

