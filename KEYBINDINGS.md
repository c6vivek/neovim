# LazyVim Keybindings — Vivek's Setup

Leader is `<space>`. Press `<leader>` alone and wait 300ms — which-key shows
everything. This file is reachable via `<leader>fc` (Find Config File).

## The 10 bindings worth burning into muscle memory first

| Keys | Action | Replaces (old setup) |
|---|---|---|
| `<leader><space>` | Find files (fuzzy, root dir) — fastest launcher | `<leader>ff` |
| `<leader>/` | Grep across project | `<leader>fs` |
| `<leader>,` | Switch buffer (MRU-sorted picker) | harpoon `<C-e>` |
| `<leader>bb` | Bounce to last buffer (edit two files ping-pong) | harpoon `h1`/`h2` |
| `<S-h>` / `<S-l>` | Prev / next buffer | `<TAB>` cycling |
| `s` | **Flash**: jump anywhere on screen (type 2 chars, hit label) | `/` search + `w`/`e` hops |
| `<leader>e` | Toggle file explorer | `<leader>ee` |
| `<leader>gg` | lazygit (floating) | `<leader>g` |
| `<leader>sk` | **Search keymaps** — fuzzy-find any binding | — |
| `<leader>?` | Buffer-local keymaps (what's live in THIS file) | — |

## Old habit → new binding

| Old | New | Notes |
|---|---|---|
| `<leader>ff` find files | `<leader>ff` | unchanged ✓ (or `<leader><space>`) |
| `<leader>fr` recent files | `<leader>fr` | unchanged ✓ |
| `<leader>fg` git files | `<leader>fg` | unchanged ✓ |
| `<leader>fb` buffers | `<leader>fb` | unchanged ✓ (or `<leader>,`) |
| `<leader>fs` live grep | `<leader>/` or `<leader>sg` | |
| `<leader>fw` grep word | `<leader>sw` | works on visual selection too |
| `<leader>g` lazygit | `<leader>gg` | `<leader>g` is now a *group* prefix |
| `<leader>ee` nvim-tree | `<leader>e` | `<leader>E` = cwd root; `<leader>fe` = reveal current file |
| `<leader>ef` reveal in tree | `<leader>fe` | |
| `<leader>xx` Trouble | `<leader>xx` | unchanged ✓ (`xX` = buffer only) |
| `<leader>ha` / `h1-4` harpoon | buffers + `<leader>,` + `<leader>bb` | or enable `editor.harpoon2` extra later |
| `<C-e>` harpoon menu | `<leader>,` | |
| `<leader>sm` maximize split | `<C-w>o` | native: close all other windows. Also `<C-w>|` / `<C-w>_` |
| `<leader>rn` rename | `<leader>cr` | c = code group |
| `<leader>mp` format | — | removed by design |
| `<leader>l` lint | — | removed by design |
| `gcc` comment | — | omitted by design |
| `gr` / `gd` / `K` | unchanged ✓ | references / definition / hover |
| `<C-h/j/k/l>` splits | unchanged ✓ | (Neovim splits only — tmux panes via herdr now) |

## Finding & searching (`<leader>f` = file, `<leader>s` = search)

- `<leader><space>` / `<leader>ff` — find files (root) · `fF` cwd
- `<leader>fr` — recent files · `fR` recent in cwd
- `<leader>fg` — git-tracked files
- `<leader>/` — grep · `<leader>sg` — live grep (root) · `sG` cwd
- `<leader>sw` — grep word/selection
- `<leader>,` — buffers · `<leader>fb`
- `<leader>sh` — help pages · `<leader>sk` — keymaps · `<leader>sd` — diagnostics
- `<leader>sR` — resume last picker
- `<leader>sb` — lines in current buffer (jump to any line, fuzzy)

## Git (gitsigns + lazygit)

- `<leader>gg` — lazygit (root) · `gG` (cwd)
- `]h` / `[h` — next / previous hunk
- `<leader>ghp` — preview hunk inline
- `<leader>ghb` — blame line · `<leader>gb` — line history picker
- `<leader>ghs` / `ghr` — stage / reset hunk
- `<leader>gs` — git status picker · `<leader>gf` — current file history
- `<leader>gB` — open file on GitHub/GitLab in browser

## Navigating code (LSP / Trouble)

- `gd` — definition · `gr` — references · `K` — hover (jump back with `<C-o>`)
- `<leader>cs` — document symbols outline (Trouble) — great for reading big files
- `<leader>cS` — LSP panel (all refs/defs/etc.)
- `<leader>xx` — project diagnostics · `<leader>xX` — buffer diagnostics
- `]d` / `[d` — next / prev diagnostic · `]e` / `[e` — errors only
- Note: only `lua_ls` is enabled by default. For other languages run `:LazyExtras`
  and enable e.g. `lang.typescript`, `lang.python` (adds LSP; syntax highlighting
  already works everywhere via treesitter, no LSP needed).

## Flash (new — the biggest quality-of-life win)

- `s` + 2 chars — jump anywhere visible; labels appear on all matches
- `S` — treesitter-aware selection (select function/if/loop bodies)
- `<C-s>` while in a `/` search — toggle jump-labels on the matches

## Explorer (snacks.explorer)

- `<leader>e` toggle (all files) · `<leader>fe` open at current file · `<leader>E` cwd root
- `<leader>ge` toggle **git-changed files only** (VSCode Source Control style sidebar)
  - Tab = stage/unstage · `<c-r>` = restore file · live diff preview in main window
  - `<leader>e` and `<leader>ge` replace each other — one sidebar, two modes
  - `<leader>gs` = same list as a full picker with large diff preview
- Press `?` inside the explorer for its own keymap help

## Buffers & windows

- `<S-h>` / `<S-l>` — prev/next buffer · `[b` / `]b` same
- `<leader>bd` — close buffer · `<leader>bo` — close others
- `<leader>-` / `<leader>|` — split below / right
- `<C-w><space>` — window hydra mode (which-key stays open, keep chaining)
- `<C-Up/Down/Left/Right>` — resize

## Trying themes (before freezing one)

- `<leader>uC` — colorscheme picker with **live preview** while you cycle (Enter keeps it
  for the session, closing restores the old one)
- Browse online: https://dotfyle.com/neovim/colorscheme/trending and https://vimcolorschemes.com
- TokyoNight (current default) style previews: https://folke.github.io/tokyonight.nvim/
- Current theme: **Catppuccin Mocha**, set in `lua/plugins/colorscheme.lua`
  (flavours: latte / frappe / macchiato / mocha — edit `flavour` there and `:restart`)

## UI & misc

- `<leader>uw` — toggle line wrap (off by default; nice when reading long lines)
- `<leader>u` — all UI toggles (explore this group)
- `<c-/>` — toggle floating terminal
- `<leader>cm` — Mason (LSP installer)
- `<leader>L` — LazyVim changelog
- `<leader>qq` — quit all

## which-key navigation (how to never memorize anything)

1. Press `<leader>` and wait — popup shows all groups (mnemonic: f=find,
   s=search, g=git, b=buffer, w=window, u=ui, x=diagnostics, c=code, q=quit).
2. Keep typing to filter the popup; `<esc>` closes.
3. `g`, `[`, `]`, `z`, `gs`, `<C-w>` are groups too — press and wait.
4. `<leader>sk` fuzzy-searches every keymap in Neovim.
5. `<leader>?` shows only bindings active in the current buffer (e.g. LSP keys).
6. Popup delay is 300ms (`timeoutlen`) and everything is lazy-loaded, so it
   feels instant — the sluggishness of the old setup is gone.
