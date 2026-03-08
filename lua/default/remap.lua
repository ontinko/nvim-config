local cmd = vim.cmd
local set = vim.keymap.set

set("n", "<leader>fe", ":Neotree toggle<CR>")
-- set("n", "<leader>fe", ":NvimTreeToggle<CR>")
set("n", "H", ":noh<CR>")

set("n", "<leader>q", cmd.q)
set("n", "<leader>aq", cmd.qall)
set("n", "<leader>w", cmd.w)

set("n", "<M-k>", "<C-u>zz")
set("n", "<M-j>", "<C-d>zz")

set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

set("n", "U", "<C-r>")

set("n", "Q", "<nop>")
set("i", "<M-e>", "<Esc>")

set("n", "<leader>ld", function() vim.diagnostic.open_float() end)

set("n", "<leader>c", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

set("n", "<leader><Tab>", "<C-w>")

set("n", "<Tab>e", ":tabnew<CR>")
set("n", "<Tab>q", ":tabclose<CR>")
set("n", "<Tab>s", ":tab split<CR>")
set("n", "<Tab>h", ":-tabnext<CR>")
set("n", "<Tab>l", ":+tabnext<CR>")
