vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("camilo.remap")
require("camilo.packer")
require("camilo.set")
vim.cmd.colorscheme "catppuccin-mocha"
vim.opt.termguicolors = true
require("bufferline").setup{}

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

local default_plugings = {
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        init = function()
            require("core.utils").load_mappings "nvimtree"
        end,
        opts = function()
            return require "plugins.configs.nvimtree"
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "nvimtree")
            require("nvim-tree").setup(opts)
            vim.g.nvimtree_side = opts.view.side
        end,
    },

    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
            return { override = require("nvchad_ui.icons").devicons }
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "devicons")
            require("nvim-web-devicons").setup(opts)
        end,
    },
}
