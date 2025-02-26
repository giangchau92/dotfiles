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
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-k>", "<C-w>k") -- not working?
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-l>", "<C-w>l")

keymap.set("v", "<C-c>", '"+y') -- Copy
keymap.set("v", "<D-x>", '"+x') -- Copy
keymap.set("i", "<A-BS>", "<C-w>") -- Delete
keymap.set("c", "<A-BS>", "<C-w>") -- Delete

-- Do things without affecting the registers
-- keymap.set("n", "x", '"_x', opts)
-- keymap.set("v", "x", '"_x', opts)
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
-- keymap.set("n", "<C-[>", "<C-o>", opts)

-- Go to definition
keymap.set("n", "<C-d>", vim.lsp.buf.definition, { desc = "Go to definition", noremap = true, silent = true })

-- Scrolling
keymap.set("n", "<C-]>", "5<C-e>", { desc = "Scrolling down", noremap = true, silent = true })
keymap.set("n", "<C-[>", "5<C-y>", { desc = "Scrolling up", noremap = true, silent = true })
-- keymap.set("n", "<Esc>", "5<C-y>", { desc = "Scrolling up", noremap = true, silent = true })

keymap.set("v", "<Leader>c-c", "<Plug>(comment_toggle_linewise_visual)")

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
keymap.del("n", "<leader>sa")
keymap.del("n", "<leader>sD")
keymap.del("n", "<leader>sc")
keymap.del("n", "<leader>sC")
keymap.del("n", "<leader>l")
keymap.del("n", "<leader>sh")
keymap.del("n", "<leader>sH")
keymap.del("n", "<leader>sk")
keymap.del("n", "<leader>sR")
keymap.del("n", "<leader>sG")
keymap.del("n", "<leader>sl")
keymap.del("n", "<leader>sM")
keymap.del("n", "<leader>s\"")
keymap.del("n", "<leader>S")
-- git
keymap.del("n", "<leader>gB")
keymap.del("n", "<leader>gc")
keymap.del("n", "<leader>ge")
keymap.del("n", "<leader>gf")
keymap.del("n", "<leader>gg")
keymap.del("n", "<leader>gG")
keymap.del("n", "<leader>gl")
keymap.del("n", "<leader>gL")
keymap.del("n", "<leader>gs")
keymap.del("n", "<leader>gY")
-- move selected lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--[[
keymap.set("n", "<Leader><space>", function()
  require("telescope.builtin").find_files({
    sorting_strategy = "ascending",
    path_display = { "smart" }, -- Show shortened paths
    follow = true, -- Follow symlinks
  })
end, { desc = "Find files with file names prioritized", noremap = true, silent = true })

keymap.set("n", "<Leader>ff", function()
    local builtin = require("telescope.builtin")
    builtin.find_files({
        no_ignore = false,
        hidden = true,
        sorting_strategy = "ascending",
        path_display = { "smart" }, -- Show shortened paths
        follow = true, -- Follow symlinks
    })
end, { desc = "Find files with file names hidden file", noremap = true, silent = true })


-- keymap.set("n", "<Leader><space>", function()
--   require("telescope.builtin").find_files({
--     sorting_strategy = "ascending",
--     path_display = { "truncate" }, -- Show shortened paths
--     follow = true, -- Follow symlinks
--   })
-- end, { desc = "Find files with file names prioritized", noremap = true, silent = true })
]]
