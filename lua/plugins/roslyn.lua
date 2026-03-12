return {
  "seblyng/roslyn.nvim",
  dependencies = {
    "mason-org/mason.nvim",
  },
  opts = {},
  config = function(_, opts)
    require("roslyn").setup(opts)
  end,
}
