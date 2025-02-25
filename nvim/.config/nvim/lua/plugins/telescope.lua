return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    enabled = false,
    keys = {
      {
        "<leader>bs",
        function()
          require("telescope.builtin").lsp_document_symbols({
            symbols = LazyVim.config.get_kind_filter(),
            -- sorting_strategy = "ascending", -- Display symbols top-to-bottom as they appear in the file
          })
        end,
        desc = "Go to LSP symbol",
        noremap = true,
        silent = true,
      },
      {
        "fs",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            additional_args = { "--hidden" },
          })
        end,
        desc = "Search string in project, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        "de",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers",
      },
      --[[ {
        ";f",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      }, ]]
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = {
        sorting_strategy = "ascending", -- Show the most relevant results first
        path_display = { "smart" }, -- Show only the file name (not the full path)
        file_ignore_patterns = { "%.git/", "node_modules/" }, -- Ignore common folders
        file_sorter = require("telescope.sorters").get_fuzzy_file, -- Fuzzy match by file name
        layout_strategy = "horizontal", -- Use horizontal layout
        layout_config = {
          prompt_position = "top", -- Move the search input to the top
        },
        -- sorting_strategy = "ascending",
      }
      opts.pickers = {
        find_files = {
          sorting_strategy = "ascending",
          path_display = { "smart" }, -- Display file names only
          follow = true, -- Follow symlinks
          layout_config = {
            prompt_position = "top", -- Specifically for find_files picker
          },
        },
        lsp_document_symbols = {
          symbols = LazyVim.config.get_kind_filter(),
          sorting_strategy = "ascending", -- Order symbols as they appear in the document
        },
        lsp_workspace_symbols = {
          symbols = LazyVim.config.get_kind_filter(),
          sorting_strategy = "ascending", -- Order symbols by relevance or appearance
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
        fzf = {
          fuzzy = true, -- Enable fuzzy matching
          override_generic_sorter = true, -- Replace generic sorter with fzf
          override_file_sorter = true, -- Replace file sorter with fzf
          case_mode = "smart_case", -- Case-insensitive unless uppercase in query
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")

    end,
  },
}

