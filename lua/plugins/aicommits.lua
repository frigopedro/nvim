return {
  "404pilo/aicommits.nvim",
  event = "VeryLazy",
  config = function()
    local function read_env_key(path, key)
      local lines = vim.fn.readfile(path)
      for _, line in ipairs(lines) do
        if not line:match("^%s*#") and line:match("%S") then
          local k, v = line:match("^%s*export%s+([%w_]+)%s*=%s*(.-)%s*$")
          if not k then
            k, v = line:match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
          end
          if k == key and v then
            v = v:gsub("^%s*['\"]", ""):gsub("['\"]%s*$", "")
            return v
          end
        end
      end
    end

    local function find_env_file()
      local start = vim.fn.getcwd()
      local buf = vim.api.nvim_get_current_buf()
      if buf and vim.api.nvim_buf_is_valid(buf) then
        local name = vim.api.nvim_buf_get_name(buf)
        if name ~= "" then
          start = vim.fs.dirname(name)
        end
      end
      local matches = vim.fs.find(".env", { path = start, upward = true })
      return matches[1]
    end

    local openai_api_key = vim.env.AICOMMITS_NVIM_OPENAI_API_KEY or vim.env.OPENAI_API_KEY
    if not openai_api_key or openai_api_key == "" then
      local env_file = find_env_file()
      if env_file then
        openai_api_key = read_env_key(env_file, "AICOMMITS_NVIM_OPENAI_API_KEY")
          or read_env_key(env_file, "OPENAI_API_KEY")
      end
    end
    if openai_api_key == "" then
      openai_api_key = nil
    end

    require("aicommits").setup({
      providers = {
        openai = {
          api_key = openai_api_key,
        },
      },
    })
  end,
}
