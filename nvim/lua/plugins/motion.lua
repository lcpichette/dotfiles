-- nvim/lua/plugins/motion.lua
return {
  -- 1. Spider.nvim: Smarter w/b/e motions (camelCase-aware, etc.)
  {
    "chrisgrieser/nvim-spider",
    event = "BufReadPre",
    keys = {
			"e",
			"<cmd>lua require('spider').motion('e')<CR>",
			mode = { "n", "o", "x" },
		},
    config = function()
      require("spider").setup({
        -- your config here, see docs for options
        skipInsignificantPunctuation = true,
      })
    end,
  },

  -- 2. Hop.nvim: Jump to any text in the visible window with minimal keystrokes
  {
    "phaazon/hop.nvim",
    branch = "v2", -- ensure we’re on v2
    config = function()
      require("hop").setup({
        -- see :h hop-config for all options
        -- e.g., case_insensitive = true,
      })

      -- “f” motion for 2-character search across the *entire visible buffer*
      -- After pressing `f`, type e.g. `c` then `h` to jump to the first “ch”.
      vim.keymap.set({ "n", "x", "o" }, "f", function()
        require("hop").hint_char2({
          current_line_only = false, -- entire visible buffer
        })
      end, { desc = "Hop 2-char search" })

      -- “t” motion for 2-character search as well (if desired).
      -- Note: This won’t precisely replicate Vim’s native “t” offset behavior
      -- (jumping *before* the character), but does a 2-char Hop instead.
      vim.keymap.set({ "n", "x", "o" }, "t", function()
        require("hop").hint_char2({
          current_line_only = false, 
        })
      end, { desc = "Hop 2-char search (like 't')" })
    end,
  },

  -- 3. targets.vim: Additional text objects (e.g., in repeated quotes, blocks, etc.)
  {
    "wellle/targets.vim",
    event = "VeryLazy",
  },
}

