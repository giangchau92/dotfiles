return {
	"folke/which-key.nvim",
	version = "v3.10.0", -- Use a specific tag
	event = "VeryLazy",
    enabled = true,
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>b", group = "Buffers" },
			{
				"<leader>ba",
				"<cmd>BufferLineCloseLeft<cr><cmd>BufferLineCloseRight<cr>",
				desc = "Close all but current buffer",
			},
			{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Find buffer" },
			{ "<leader>bf", "<cmd>BufferLinePick<cr>", desc = "Pick buffer" },
			{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all buffers to the left" },
			{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Close all BufferLines to the right" },
			{ "<leader>bx", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort BufferLines by directory" },

			{ "<leader>f", group = "Files" },
			{ "<leader>fb", "<cmd>:cd %:h|Telescope file_browser<cr>", desc = "File browser" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },


			--[[ { "<leader>q", group = "Quickfix" },
			{ "<leader>qj", "<cmd>cnext<cr>", desc = "Next Quickfix Item" },
			{ "<leader>qk", "<cmd>cprevious<cr>", desc = "Previous Quickfix Item" },
			{ "<leader>qq", "<cmd>lua require('functions').toggle_qf()<cr>", desc = "Toggle quickfix list" }, ]]
			{ "<leader>qt", "<cmd>TodoTelescope<cr>", desc = "Show TODOs" },

			{ "<leader>s", group = "Search" },
			{ "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },

			{ "<leader>w", group = "Window" },
			{ "<leader>w=", "<c-w>=", desc = "Equally size" },
			{ "<leader>wq", "<cmd>:q<cr>", desc = "Close" },
			{ "<leader>wt", "<c-w>t", desc = "Move to new tab" },
			{ "<leader>wv", "<cmd>:vsplit<cr>", desc = "Vertical Split" },
			--{ "<leader>ww", "<cmd>:ObsidianQuickSwitch<cr>|cd /Users/spencer/repos/VimWiki/", desc = "Open Vimwiki Index" },
		})
	end,
}
