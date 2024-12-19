return {
  { "jose-elias-alvarez/typescript.nvim", lazy = true }, -- add lsp plugin
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      setup_handlers = {
        -- add custom handler
        tsserver = function(_, opts)
          require("typescript").setup { server = {
            opts,
            enabled = false,
          } }
        end,
      },
      features = {
        inlay_hints = false,
      },
    },
  },
}
