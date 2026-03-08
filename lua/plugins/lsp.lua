local ensure_installed = {
  -- "solargraph",
  "html",
  -- "pylsp",
  "yamlls",
  "ts_ls",
  "cssls",
  -- "gopls",
  "lua_ls",
  -- "clangd",
  "phpactor",
  "intelephense",
  "vuels",
  "prismals",
  -- "sqls",
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local registry = require("mason-registry")

      local function setup()
        mason_lspconfig.setup({
          ensure_installed = ensure_installed,
        })
      end

      registry.refresh(function(success)
        setup()
        if not success then
          vim.schedule(function()
            vim.notify("Mason registry refresh failed; using cached registry data", vim.log.levels.WARN)
          end)
        end
      end)
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")
      lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        lsp.default_keymaps({ buffer = bufnr })
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
        vim.keymap.set("n", "<leader>li", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
      end)

      lsp.setup()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = {
          ["<M-o>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<M-k>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<M-j>"] = cmp.mapping.select_next_item(cmp_select_opts),
          ["<M-p>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item(cmp_select_opts)
            else
              cmp.complete()
            end
          end),
          ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item(cmp_select_opts)
            else
              cmp.complete()
            end
          end),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          documentation = {
            max_height = 15,
            max_width = 60,
          },
        },
        formatting = {
          fields = { "abbr", "menu", "kind" },
          format = function(entry, item)
            local short_name = {
              nvim_lsp = "LSP",
              nvim_lua = "nvim",
            }

            local menu_name = short_name[entry.source.name] or entry.source.name
            item.menu = string.format("[%s]", menu_name)
            return item
          end,
        },
      })
    end,
  },
}
