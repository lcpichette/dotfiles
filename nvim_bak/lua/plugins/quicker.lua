-- better quickfix and location list
return {
  "stevearc/quicker.nvim",
  event = "FileType qf",
  ---@module "quicker"
  ---@type quicker.SetupOptions
  opts = {},
  config = function()
    -- Define the focus functions
    local function focus_quickfix()
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.fn.getwininfo(win)[1].quickfix == 1 then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
      print "Quickfix window is not open"
    end

    local function focus_loclist()
      local current_tab = vim.api.nvim_get_current_tabpage()
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(current_tab)) do
        if vim.fn.getwininfo(win)[1].loclist == 1 then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
      print "Location list window is not open"
    end

    -- Set keybindings
    vim.keymap.set("n", "<leader>fq", focus_quickfix, { desc = "Focus Quickfix List" })
    vim.keymap.set("n", "<leader>fl", focus_loclist, { desc = "Focus Location List" })
  end,
}
