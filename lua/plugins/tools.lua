return {
  {
    "NickvanDyke/opencode.nvim",
    lazy = false,
    config = function()
      local ok, opencode = pcall(require, "opencode")
      if ok and type(opencode.setup) == "function" then
        opencode.setup({})
      end
    end,
  },
}
