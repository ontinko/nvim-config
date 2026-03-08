return {
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<leader>ps",
        function()
          if vim.fn.executable("rg") == 0 then
            vim.notify("telescope.live_grep needs ripgrep (`rg`). Install: sudo apt install ripgrep", vim.log.levels.WARN)
            return
          end
          require("telescope.builtin").live_grep()
        end,
      },
      {
        "<M-p>",
        function()
          require("telescope.builtin").git_files()
        end,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        enable_git_status = true,
        window = {
          position = "right",
          width = 70,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["l"] = "open",
          },
        },
      })
    end,
  },
}
