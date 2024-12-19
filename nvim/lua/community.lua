-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.disable-tabline" },
  { import = "astrocommunity.pack.zig" },
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  -- { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.angular" },
  -- import/override with your plugins folder
}
