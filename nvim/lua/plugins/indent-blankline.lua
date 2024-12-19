return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        enabled = true,
        show_start = true,
        show_end = true,
        highlight = "IblScope",
      },
      exclude = {
        filetypes = { "help", "dashboard", "NvimTree", "packer" },
        buftypes = { "terminal" },
      },
    },
  },
}
