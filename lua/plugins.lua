return {
    ---------------------------------------------------------
    -- Colorscheme eldritch
      { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000 , config = true, opts = {}},
    ---------------------------------------------------------
    -- telescope for live file system search and grep of files ( add macros here :))
      { "nvim-telescope/telescope.nvim", tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
    ---------------------------------------------------------
    -- nvim treesitter based highlighter
      { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    ---------------------------------------------------------
    -- dashboard, the janc way
      { 'nvimdev/dashboard-nvim', event = 'VimEnter', 
         config = function()
            require('dashboard').setup {}
               end,
         dependencies = {{'nvim-tree/nvim-web-devicons'}}},
    --------------------------------------------------------
    -- neotree file structure, so pretty 
      { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = { "nvim-lua/plenary.nvim","nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}}
}
