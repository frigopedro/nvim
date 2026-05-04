return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts.dashboard = { enabled = true, custom_header = { "  Pedro's Nvim Config " } }
    end,
  },
}
