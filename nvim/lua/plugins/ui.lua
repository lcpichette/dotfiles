-- Plugins specific to altering the UI of neovim
return {
  -- dressing.nvim: Improve Neovim's UI for input and selection
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy", -- Load the plugin when Neovim is idle
    opts = {
      -- Customize the UI components
      input = {
        -- Default options for input UI
        enabled = true,
        default_prompt = "➤ ",
        prompt_align = "left",
        insert_only = true,
        start_in_insert = true,
        relative = "editor",
        prefer_width = 60,
        width = nil,
        max_width = nil,
        min_width = 20,
        border = "rounded",
        anchor = "NW",
        pos = "100%",
        row = 1,
        col = 1,
      },
      select = {
        -- Default options for select UI
        enabled = true,
        backend = { "telescope", "builtin" },
        builtin = {
          -- Customize the selection UI
          border = "rounded",
          -- Position the selection window at the top
          anchor = "NW",
          -- Optional: Adjust the position offset
          post = "100%",
        },
      },
    },
    config = function(_, opts)
      require("dressing").setup(opts)
    end,
  },

  -- LSP Progress indicator
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "dots",
        },
        window = {
          relative = "win",
          blend = 0,
        },
        fmt = {
          stack_upwards = true,
          lsp_client_name = true,
          task = false,
        },
      })
    end,
  },

  -- lualine, bottom status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local lualine = require("lualine")

      -- Define Oxocarbon color palette
      local oxo = {
        fg = "#c0caf5", -- Default foreground
        purple = "#bb9af7", -- Purple
        blue = "#7aa2f7", -- Blue
        green = "#7dcfff", -- Green for LSP
        red = "#f7768e", -- Red for diagnostics
      }

      -- Custom lualine theme with no background colors
      local custom_theme = {
        normal = {
          a = { fg = oxo.purple, gui = "bold" },
          b = { fg = oxo.fg },
          c = { fg = oxo.fg },
        },
        insert = { a = { fg = oxo.blue, gui = "bold" } },
        visual = { a = { fg = oxo.purple, gui = "bold" } },
        replace = { a = { fg = oxo.red, gui = "bold" } },
        inactive = {
          a = { fg = oxo.fg },
          b = { fg = oxo.fg },
          c = { fg = oxo.fg },
        },
      }

      -- Helper function to get active LSP servers
      local function lsp_info()
        local clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #clients == 0 then
          return ""
        end
        local names = {}
        for _, client in ipairs(clients) do
          table.insert(names, client.name)
        end
        return "⦿ " .. table.concat(names, ", ")
      end

      -- Helper function to get active linters using nvim_lint
      local function linters_info()
        local lint = require("lint")
        local filetype = vim.bo.filetype
        local linters = lint.linters_by_ft[filetype] or {}
        if #linters == 0 then
          return ""
        end
        return "▣ " .. table.concat(linters, ", ")
      end

      -- Configure lualine
      lualine.setup({
        options = {
          theme = custom_theme,
          section_separators = "",
          component_separators = "",
          disabled_filetypes = { statusline = {}, winbar = {} },
          always_divide_middle = false,
          globalstatus = true, -- Requires Neovim 0.7+
        },
        sections = {
          -- Left sections
          lualine_a = {
            {
              "mode",
              fmt = function(mode)
                return mode:sub(1, 1)
              end,
              color = { fg = oxo.purple, gui = "bold" },
            },
          },
          lualine_b = { "branch" },
          -- Center is empty for minimalism
          lualine_c = {},
          -- Right sections
          lualine_x = {
            {
              "filename",
              path = 1, -- Relative path
              symbols = { modified = " ●", readonly = " 🔒", unnamed = "[No Name]" },
            },
          },
          lualine_y = {
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              symbols = { error = " ", warn = " ", info = " ", hint = " " },
              diagnostics_color = {
                color_error = { fg = oxo.red },
                color_warn = { fg = oxo.purple },
                color_info = { fg = oxo.blue },
                color_hint = { fg = oxo.green },
              },
            },
            {
              function()
                return lsp_info()
              end,
              icon = " ",
              color = { fg = oxo.green },
            },
            {
              function()
                return linters_info()
              end,
              icon = "⚙️ ",
              color = { fg = oxo.blue },
            },
          },
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = {},
      })
    end,
  },

  -- "Splash art" for opening neovim without specifying a file
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Add dependencies if needed
    config = function()
      -- Initialize the dashboard theme
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#7dcfff" }) -- Example: Blue text color
      vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#bb9af7" }) -- Example: Purple text for buttons

      -- Apply the highlight group to the header
      dashboard.section.header.opts.hl = "AlphaHeader"

      -- Customize the dashboard header
      dashboard.section.header.val = [[
        _                ___       _.--.
        \`.|\..----...-'`   `-._.-'_.-'`
        /  ' `         ,       __.--'
        )/' _/     \   `-_,   /
        `-'" `"\_  ,_.-;_.-\_ ',     
            _.-'_./   {_.'   ; /
bug.       {_.-``-'         {_/
      ]]

      -- Optionally customize the buttons (emptying them as per your original config)
      dashboard.section.buttons.val = {}

      -- Set up the alpha with the customized dashboard
      alpha.setup(dashboard.opts)
    end,
  },

  -- Changes alerts, command line aesthetic and location, and some other ui things

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline", -- Use the classic cmdline view
        opts = {
          position = {
            row = 0, -- Position at the very top
            col = 2, -- Align to the left
          },
          size = {
            width = "80%", -- Extend across the width of the buffer
            height = 1, -- Keep it one line tall
          },
        },
        format = {
          cmdline = { pattern = "^:", icon = "", lang = "vim" },
          search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
          filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
          lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
          help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
          input = { view = "cmdline", icon = "󰥻 " }, -- Classic feel
        },
      },
      popupmenu = {
        enabled = true,
        backend = "nui",
      },
      messages = {
        enabled = true,
        view = "notify",
      },
      lsp = {
        progress = {
          enabled = true,
          view = "mini",
        },
        hover = {
          enabled = true,
        },
        signature = {
          enabled = true,
          auto_open = {
            enabled = true,
            trigger = true,
            luasnip = true,
            throttle = 50,
          },
        },
      },
      notify = {
        enabled = true,
        view = "notify",
      },
      presets = {
        bottom_search = false, -- Disable classic bottom search
        command_palette = false,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
}
