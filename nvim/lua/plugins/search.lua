return {
  -- Telescope: Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      -- Plenary is required by Telescope
      "nvim-lua/plenary.nvim",
      -- Optional: FZF for faster searching
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = vim.fn.executable("make") == 1,
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              -- Send all search results to Quickfix list with <C-q>
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              -- Multi-select with <Tab> / <S-Tab>
              ["<Tab>"] = function(prompt_bufnr)
                actions.toggle_selection(prompt_bufnr)
                actions.move_selection_next(prompt_bufnr)
              end,
              ["<S-Tab>"] = function(prompt_bufnr)
                actions.toggle_selection(prompt_bufnr)
                actions.move_selection_previous(prompt_bufnr)
              end,
              -- Send selected entries to Quickfix
              ["<C-s>"] = function(prompt_bufnr)
                local picker = action_state.get_current_picker(prompt_bufnr)
                local multi_selection = picker:get_multi_selection()
                if vim.tbl_isempty(multi_selection) then
                  -- If nothing selected, use current entry
                  local entry = action_state.get_selected_entry()
                  multi_selection = { entry }
                end
                actions.send_selected_to_qflist(prompt_bufnr)
                actions.open_qflist(prompt_bufnr)
                actions.close(prompt_bufnr)
              end,
            },
          },
        },
      })

      -- If you installed telescope-fzf-native, load it:
      pcall(telescope.load_extension, "fzf")
    end,
  },

  -- nvim-bqf: Better Quickfix window UI
  {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          auto_preview = false,
          border_chars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        func_map = {
          open = "<CR>",
          pscrollup = "<C-b>",
          pscrolldown = "<C-f>",
        },
      })
    end,
  },

  -- which-key: Real-time key mapping assistance
  {
    "folke/which-key.nvim",
    event = "VeryLazy", -- load which-key once Neovim is mostly idle
    config = function()
      local which_key = require("which-key")
      which_key.setup({})
    end,
  },

  -- Arrow: Harpoon-alternative for adding freq-acc files
  {
    "otavioschwanck/arrow.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- or if using `mini.icons`
      -- { "echasnovski/mini.icons" },
    },
    opts = {
      show_icons = true,
    },
  },

  -- Adds searchable diagnostic reporting
  {
    "folke/trouble.nvim",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
    opts = {},
  },
}