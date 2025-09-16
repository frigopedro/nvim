return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- load before all the other start plugins
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
