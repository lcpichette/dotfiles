return {
  -- Other plugin specifications
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim", "luarocks.nvim" },
    config = function()
      -- Neorg setup
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behavior
          ["core.concealer"] = {}, -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/neorg/notes",
              },
            },
          },
          ["core.keybinds"] = { -- Configure keybindings
            config = {
              default_keybinds = false, -- Disable default keybindings
              neorg_leader = "<Leader>n", -- Set Neorg leader key
              hook = function(keybinds)
                keybinds.map_event_to_mode("norg", {
                  n = { -- Normal mode
                    { "nn", "core.norg.dirman.new.note" },
                    { "nt", "core.norg.qol.todo_items.todo.task_done" },
                    -- Add more custom mappings here
                  },
                  i = { -- Insert mode
                    -- Insert mode mappings
                  },
                }, {
                  silent = true,
                  noremap = true,
                })
              end,
            },
          },
        },
      }
    end,
  },
}
