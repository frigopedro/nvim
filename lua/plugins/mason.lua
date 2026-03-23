return {
  "mason-org/mason.nvim",
  opts = function(_, opts)
    opts.registries = opts.registries or { "github:mason-org/mason-registry" }
    if not vim.tbl_contains(opts.registries, "github:Crashdummyy/mason-registry") then
      table.insert(opts.registries, "github:Crashdummyy/mason-registry")
    end
  end,
}
