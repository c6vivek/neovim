# neovim

My Neovim config — a [LazyVim](https://www.lazyvim.org/) (v16) setup tuned for
reading and navigating code over SSH, with no AI suggestions, completion,
snippets, linting, or formatting.

See [KEYBINDINGS.md](KEYBINDINGS.md) for the full keymap cheat sheet.

## Machine requirements

- **Neovim ≥ 0.11.2** (running 0.12.5, official tarball installed to
  `~/.local/nvim`, symlinked from `~/.local/bin/nvim` — apt's version is too old)
- **tree-sitter CLI** (`npm install -g tree-sitter-cli`) — required by the new
  nvim-treesitter main branch to compile parsers, plus a C compiler (gcc)
- **lazygit** — opens via `<leader>gg`
- **a Nerd Font** in the terminal (for icons)

## What's on top of stock LazyVim

| File | Purpose |
|---|---|
| `lua/plugins/colorscheme.lua` | Catppuccin Mocha theme |
| `lua/plugins/git-sidebar.lua` | `<leader>ge` — VSCode-style git-changed-files sidebar; `<leader>e`/`ge` switch modes |
| `lua/plugins/disabled.lua` | Disabled: blink.cmp (completion), conform.nvim (formatting), nvim-lint (linting), tokyonight |
| `lua/config/options.lua` | `vim.g.autoformat = false` |
| `lazyvim.json` | Enabled extras: `snacks_picker`, `snacks_explorer` |

## Extras deliberately NOT enabled

Completion/snippets (`coding.*`), AI (`ai.*`), linting/formatting extras,
`coding.mini-comment` (no commenting keymaps), `editor.harpoon2`
(buffer cycling + pickers cover it — flip it on via `:LazyExtras` if missed).

## Installing on a new machine

```sh
git clone git@github.com:c6vivek/neovim.git ~/.config/nvim
nvim   # plugins install automatically from lazy-lock.json
```

Then run `:checkhealth` once. Reload during iteration: `:source %` for
`lua/config/*` changes, `:restart` for plugin spec changes (+ `<leader>qs` to
restore the session).
