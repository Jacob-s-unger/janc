-- Eldritch Colorscheme
return { "eldritch-theme/eldritch.nvim",
          lazy = false,
          priority = 1000,  
          config = true, 
          config = function()
            vim.cmd.colorscheme "eldritch"
          end
        }
