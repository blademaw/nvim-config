vim.g.mapleader = " " -- space leader key

local keymap = vim.keymap -- conciseness

-- general
keymap.set("n", "x", '"_x') -- don't copy single deleted chars

-- frames
keymap.set("n", "<leader>w/", "<C-w>v") -- split window right
keymap.set("n", "<leader>wh", "<C-w>s") -- split window bottom
keymap.set("n", "<leader>wd", ":close<CR>") -- close window
keymap.set("n", "<leader>wm", ":MaximizerToggle<CR>") -- maximize current window

-- nvim-tree
keymap.set("n", "<leader>t", ":NvimTreeFindFileToggle<CR>") -- show tree

-- magma stuff
vim.api.nvim_set_keymap('n', '<leader>r', "v:lua.vim.api.nvim_exec('MagmaEvaluateOperator', v:true)..'<CR>'", {silent = true, expr = true})
vim.api.nvim_set_keymap('v', '<leader>r', "v:lua.vim.api.nvim_exec('MagmaEvaluateOperator', v:true)..'<CR>'", {silent = true, expr = true})
keymap.set("n", "<leader>ms", ":MagmaInit<CR>1<CR>", { silent = true })
keymap.set("n", "<leader>rl", ":MagmaEvaluateLine<CR>", {silent = true})
keymap.set("n", "<leader>rd", ":MagmaDelete<CR>", {silent = true})
keymap.set("n", "<leader>ro", ":MagmaShowOutput<CR>", {silent = true})

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find file
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- search in proj
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- buffers
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- help tags

-- expand region bindings
keymap.set("v", "H", "<Plug>(expand_region_shrink)")
keymap.set("v", "L", "<Plug>(expand_region_expand)")

-- undo tree & Git
keymap.set("n", "<leader>gs", vim.cmd.Git)
keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- move commands for moving blocks of code
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- make J keep cursor in same place
keymap.set("n", 'J', "mzJ1`z")

-- keep cursor in one place as moving and searching
keymap.set('n', '<C-d>', "<C-d>zz")
keymap.set('n', '<C-u>', "<C-u>zz")
keymap.set('n', 'n', "nzzzv")
keymap.set('n', 'N', "Nzzzv")

-- when pasting, don't delete current yank buffer
keymap.set("x", "<leader>p", "\"_dP")
keymap.set("n", "Q", "<nop>") -- no operation for Q

-- tmux (verify this)
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- instant replace & make executable
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
