return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require "telescope.actions"
      opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
        mappings = {
          i = {
            ["<C-x>"] = actions.toggle_selection + actions.move_selection_next,
            ["<C-y>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
          n = {
            ["<C-x>"] = actions.toggle_selection + actions.move_selection_next,
            ["<C-y>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      })
    end,
  },
}
