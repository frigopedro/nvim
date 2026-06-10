local function python_path(root)
  local venvs = { ".venv", "venv", ".env", "env" }
  for _, name in ipairs(venvs) do
    local path = root .. "/" .. name .. "/bin/python"
    if vim.fn.executable(path) == 1 then
      return path
    end
  end
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

local python_before_init = function(_, config)
  config.settings = config.settings or {}
  config.settings.python = config.settings.python or {}
  config.settings.python.pythonPath = python_path(config.root_dir or vim.fn.getcwd())
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      omnisharp = { enabled = false },
      pyright = {
        before_init = python_before_init,
      },
      basedpyright = {
        before_init = python_before_init,
      },
    },
  },
}
