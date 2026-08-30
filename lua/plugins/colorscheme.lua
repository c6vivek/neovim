-- Catppuccin Mocha as the colorscheme.
-- The plugin itself is already spec'd by LazyVim core (with all integrations);
-- this only selects the flavour and activates it.
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- latte | frappe | macchiato | mocha
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").load("mocha")
      end,
    },
  },
}
