return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add or skip cursor above/below the main cursor.
      -- Using Shift + Alt + arrow keys to avoid conflicts with navigation
      set({ "n", "x" }, "<S-A-up>", function()
        mc.lineAddCursor(-1)
      end, { desc = "Add cursor above" })
      set({ "n", "x" }, "<S-A-down>", function()
        mc.lineAddCursor(1)
      end, { desc = "Add cursor below" })
      set({ "n", "x" }, "<leader>m<up>", function()
        mc.lineSkipCursor(-1)
      end, { desc = "Skip cursor above" })
      set({ "n", "x" }, "<leader>m<down>", function()
        mc.lineSkipCursor(1)
      end, { desc = "Skip cursor below" })

      -- Add or skip adding a new cursor by matching word/selection
      -- Using <leader>m prefix to avoid conflicts with LazyVim defaults
      set({ "n", "x" }, "<leader>mn", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor to next match" })
      set({ "n", "x" }, "<C-d>", function()
        mc.matchAddCursor(1)
      end, { desc = "Add cursor to next match" })
      set({ "n", "x" }, "<leader>ms", function()
        mc.matchSkipCursor(1)
      end, { desc = "Skip cursor to next match" })
      set({ "n", "x" }, "<leader>mN", function()
        mc.matchAddCursor(-1)
      end, { desc = "Add cursor to prev match" })
      set({ "n", "x" }, "<leader>mS", function()
        mc.matchSkipCursor(-1)
      end, { desc = "Skip cursor to prev match" })

      -- Add all matches for current word/selection
      set({ "n", "x" }, "<leader>ma", function()
        mc.matchAllAddCursors()
      end, { desc = "Add cursors to all matches" })

      -- Add and remove cursors with control + left click.
      set("n", "<c-leftmouse>", mc.handleMouse)
      set("n", "<c-leftdrag>", mc.handleMouseDrag)
      set("n", "<c-leftrelease>", mc.handleMouseRelease)

      -- Toggle cursor at current position
      set({ "n", "x" }, "<leader>mt", mc.toggleCursor, { desc = "Toggle cursor" })

      set("x", "<leader>i", mc.insertVisual)
      set("x", "<leader>A", mc.appendVisual)

      -- Mappings defined in a keymap layer only apply when there are
      -- multiple cursors. This lets you have overlapping mappings.
      mc.addKeymapLayer(function(layerSet)
        -- Select a different cursor as the main one.
        layerSet({ "n", "x" }, "<C-n>", mc.nextCursor, { desc = "Next cursor" })
        layerSet({ "n", "x" }, "<C-p>", mc.prevCursor, { desc = "Previous cursor" })

        -- Delete the main cursor.
        layerSet({ "n", "x" }, "<leader>md", mc.deleteCursor, { desc = "Delete cursor" })

        -- Clear all cursors
        layerSet({ "n", "x" }, "<leader>mc", mc.clearCursors, { desc = "Clear all cursors" })

        -- Enable and clear cursors using escape.
        layerSet("n", "<leader>mq", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end, { desc = "Enable/Clear cursors" })
      end)

      -- Customize how cursors look.
      local hl = vim.api.nvim_set_hl
      hl(0, "MultiCursorCursor", { reverse = true })
      hl(0, "MultiCursorVisual", { link = "Visual" })
      hl(0, "MultiCursorSign", { link = "SignColumn" })
      hl(0, "MultiCursorMatchPreview", { link = "Search" })
      hl(0, "MultiCursorDisabledCursor", { reverse = true })
      hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
      hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
  },
}
