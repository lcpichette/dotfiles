return {
  {
    "smoka7/hop.nvim",
    branch = "master",
    event = "VeryLazy",
    config = function()
      require("hop").setup()

      local hop = require "hop"

      -- Map 'f' to hint the first character of words forward
      vim.keymap.set(
        "",
        "f",
        function() hop.hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR } end,
        { remap = true, silent = true, desc = "Hop forward to word" }
      )

      -- Map 'F' to hint the first character of words backward
      vim.keymap.set(
        "",
        "F",
        function() hop.hint_words { direction = require("hop.hint").HintDirection.BEFORE_CURSOR } end,
        { remap = true, silent = true, desc = "Hop backward to word" }
      )

      -- Map 't' to hint before the word forward
      vim.keymap.set(
        "",
        "t",
        function() hop.hint_words { direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 } end,
        { remap = true, silent = true, desc = "Hop forward before word" }
      )

      -- Map 'T' to hint before the word backward
      vim.keymap.set(
        "",
        "T",
        function() hop.hint_words { direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 } end,
        { remap = true, silent = true, desc = "Hop backward before word" }
      )
    end,
  },
}
