-- Plugins explicitly disabled for this setup.
--
-- LazyVim 16 auto-enables a completion engine even when no coding.* extra
-- is selected (the "defaults" system picks blink.cmp when vim.g.lazyvim_cmp
-- = "auto" and there is no documented "none" option). Since no completion
-- or snippets are wanted here, the engine itself is disabled. This is safe:
-- LazyVim 16's LSP layer has no dependency on any completion engine.
return {
  { "Saghen/blink.cmp", enabled = false },

  -- LazyVim ships conform.nvim (formatting) and nvim-lint (linting) as lazy-loaded
  -- core plugins. This setup is primarily for reading/navigating code, so both are
  -- turned off completely (no keymaps, no format-on-save, no linters ever run).
  { "stevearc/conform.nvim", enabled = false },
  { "mfussenegger/nvim-lint", enabled = false },

  -- Superseded by Catppuccin Mocha (lua/plugins/colorscheme.lua). Still
  -- spec'd by LazyVim core as its default theme, so disable to keep it from
  -- being cloned/updated. The colorscheme fallback becomes habamax.
  { "folke/tokyonight.nvim", enabled = false },
}
