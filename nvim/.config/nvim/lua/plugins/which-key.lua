return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		spec = {
			{ "<leader>l", group = "[L]ist" },
			{ "<leader>b", group = "[B]uffer" },
			{ "<leader>s", group = "[S]earch" },
			{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
			{ "<leader>d", group = "[D]ebug" },
			{ "<leader>r", group = "[R]ename" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>w", group = "[W]indow" },
			{ "<leader>t", group = "[T]oggle" },
			{ "<leader>g", group = "[G]o" },
			{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		},
	},
	keys = {
	  {
		"<leader>?",
		function()
		  require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps (which-key)",
	  },
	},
}
