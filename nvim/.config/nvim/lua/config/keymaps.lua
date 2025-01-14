-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Disable continuations
-- keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
-- keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set('v', '<C-c>', '"+y') -- Copy
keymap.set('i', '<A-BS>', '<C-w>') -- Delete
keymap.set('c', '<A-BS>', '<C-w>') -- Delete

-- Do things without affecting the registers
keymap.set("n", "x", '"_x', opts)
keymap.set("v", "x", '"_x', opts)
keymap.set("n", "d", '"_d', opts)
keymap.set("v", "d", '"_d', opts)
keymap.set("n", "c", '"_c', opts)
keymap.set("v", "c", '"_c', opts)



-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Go back
keymap.set("n", "<C-[>", "<C-o>", opts)

-- Go to definition
keymap.set("n", "<C-d>", vim.lsp.buf.definition, { desc = "Go to definition", noremap = true, silent = true })

-- Scrolling
keymap.set("n", "<C-j>", "5<C-e>", { desc = "Scrolling down", noremap = true, silent = true });
keymap.set("n", "<C-k>", "5<C-y>", { desc = "Scrolling up", noremap = true, silent = true });


keymap.set('v', '<Leader>c-c', '<Plug>(comment_toggle_linewise_visual)')

-- Remove unused keymap
keymap.del("n", "<leader>E") -- Explorer Neo-tree (cwd)
keymap.del("n", "<leader>K")
keymap.del("n", "<leader>L") -- LazyVim Changelog
keymap.del("n", "<leader>-") -- Split Window Below
keymap.del("n", "<leader>|") -- Split Window Right
keymap.del("n", "<leader>.") -- Scratch buffer toggle
keymap.del("n", "<leader>`")
keymap.del("n", "<leader>cm")
keymap.del("n", "<leader>gb")


local which_key = require("which-key")
which_key.add({
  w = nil,
}, { prefix = "<leader>g" })




-- keymap.set("n", "<Leader><space>", function()
--   require("telescope.builtin").find_files({
--     sorting_strategy = "ascending",
--     path_display = { "truncate" }, -- Show shortened paths
--     follow = true, -- Follow symlinks
--   })
-- end, { desc = "Find files with file names prioritized", noremap = true, silent = true })

