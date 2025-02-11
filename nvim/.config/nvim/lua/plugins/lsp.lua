return {
  {
    "williamboman/mason.nvim",
    -- config = function()
    -- 	require("mason").setup()
    -- end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  { "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline" },
  {
    "hrsh7th/nvim-cmp",
    enabled = true,
    --[[ config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            -- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "zls" },
          { name = "buffer" },
          { name = "path" },
          { name = "pylsp" },
          { name = "gci" },
          { name = "ts_ls" },
        }),
      })
    end, ]]
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      -- typescript
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      -- yaml
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      -- tailwindcss
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      -- python
      lspconfig.pyright.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename"})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action"})
    end,
  },
}
