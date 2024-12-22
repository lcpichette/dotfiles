-- lua/plugins/lsp.lua
return {
  -- Conform for formatting
  {
    "stevearc/conform.nvim",
    event = "BufReadPre",
    opts = {
      format_on_save = {
        -- optional settings:
        timeout_ms = 2000, -- increase if needed
        lsp_fallback = true, -- if no Conform formatter is available, try LSP
        format_on_type = false,
      },
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "dprint", "prettierd", "prettier" },
        javascriptreact = { "dprint", "prettierd", "prettier" },
        typescript = { "dprint", "prettierd", "prettier" },
        typescriptreact = { "dprint", "prettierd", "prettier" },
        angular = { "dprint", "prettierd", "prettier" },
        nextjs = { "dprint", "prettierd", "prettier" },
      },
      -- Optionally, you can customize other Conform settings here
      -- e.g., format_on_save = true
    },
    config = function(_, opts)
      require("conform").setup(opts)
    end,
  },

  -- nvim-lint for linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")

      -- Configure linters by filetype
      lint.linters_by_ft = {
        lua = { "selene" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        angular = { "dprint", "prettierd", "prettier" },
        nextjs = { "dprint", "prettierd", "prettier" },
      }

      -- Optionally, you can trigger lint on various autocmd events
      -- selene: allow(undefined_variable)
      vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "BufReadPost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  -- treesitter for advanced code highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" }, -- Load on buffer read or new file
    build = ":TSUpdate", -- Automatically update parsers when installing
    config = function()
      require("nvim-treesitter.configs").setup({
        -- List of languages to ensure are installed
        ensure_installed = {
          "lua",
          "javascript",
          "typescript",
          "tsx",
          "vim",
          "vimdoc",
          "json",
          "luadoc",
          "markdown",
          "markdown_inline",
          "nix",
          "regex",
          "scss",
          "zig",
          "norg",
          "html",
          "comment",
        },

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          enable = true, -- Enable syntax highlighting
          additional_vim_regex_highlighting = false, -- Disable Vim's regex-based highlighting
        },

        indent = {
          enable = true, -- Enable indentation based on Treesitter
        },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },

        -- Additional modules can be enabled as needed
        -- For example, textobjects, refactor, etc.
      })
    end,
  },

  -- Newline tabbing *just-working*
  {
    "tpope/vim-sleuth",
    lazy = false, -- Load immediately as it's essential for indentation
    config = function()
      -- vim-sleuth works out-of-the-box; no additional configuration needed
      -- However, if you need to customize, you can add settings here
    end,
  },
}
