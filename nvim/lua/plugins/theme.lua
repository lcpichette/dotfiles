return {
  {
    "shaunsingh/oxocarbon.nvim",
    -- Load it on startup so it's applied immediately
    lazy = false,
    priority = 1000, 
    config = function()
      -- Choose dark or light background
      vim.opt.background = "dark"
      vim.cmd.colorscheme("oxocarbon")
    end,
  },
}

