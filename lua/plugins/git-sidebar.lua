-- VSCode-style Source Control sidebar.
--
--   <leader>e   all files (regular explorer)
--   <leader>ge  only git-changed files
--
-- Opening one closes the other, so it feels like a single sidebar switching
-- between "Explorer" and "Source Control" modes. Pressing the same key again
-- closes it (toggle, same as the regular explorer).
--
-- Inside the git sidebar:
--   j/k or type to filter   navigate / search changed files
--   <cr>                    open the file under the cursor
--   <Tab>                   stage / unstage the file (git_status action)
--   <c-r>                   restore (discard) the file
--   moving over an entry    live diff preview in the main window
--
-- Full-picker alternative: <leader>gs (git status with big diff preview).
return {
  "folke/snacks.nvim",
  keys = {
    -- override <leader>e: toggle the explorer, and make it close the git
    -- sidebar when switching views (same toggle semantics as <leader>ge)
    {
      "<leader>e",
      function()
        -- already open? -> close it (toggle)
        local explorer = Snacks.picker.get({ source = "explorer", tab = true })[1]
        if explorer then
          explorer:close()
          return
        end
        -- close any other picker/sidebar (e.g. the git view) first
        for _, p in ipairs(Snacks.picker.get({ tab = true })) do
          p:close()
        end
        Snacks.explorer({ cwd = LazyVim.root() })
      end,
      desc = "Explorer Snacks (root dir)",
    },
    {
      "<leader>ge",
      function()
        local git = Snacks.picker.get({ source = "git_status", tab = true })[1]
        for _, p in ipairs(Snacks.picker.get({ tab = true })) do
          if p ~= git then
            p:close()
          end
        end
        if git then
          git:close() -- already open -> toggle closed
          return
        end
        Snacks.picker.git_status({ layout = { preset = "sidebar" } })
      end,
      desc = "Explorer Snacks (git changes)",
    },
  },
}
