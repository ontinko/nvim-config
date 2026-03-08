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
        }
    },
})
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- -- optionally enable 24-bit colour
-- vim.opt.termguicolors = true
--
-- -- OR setup with some options
-- require("nvim-tree").setup({
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 40,
--     side = 'right',
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })
