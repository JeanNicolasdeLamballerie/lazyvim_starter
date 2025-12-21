return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    -- Make sure this is set: open Neo-tree in the current window when opening directories
    opts.filesystem = opts.filesystem or {}
    opts.filesystem.hijack_netrw_behavior = "open_current"

    -----------------------------
    -- Navigator mode behavior --
    -----------------------------
    -- When selecting a file: close Neo-tree and open it
    opts.event_handlers = opts.event_handlers or {}
    table.insert(opts.event_handlers, {
      event = "file_opened",
      handler = function(file_path)
        -- Close all neo-tree windows on file open
        require("neo-tree.command").execute({ action = "close" })
      end,
    })

    return opts
  end,

  keys = {
    -- Navigator mode
    {
      "<leader>e",
      function()
        -- Opens Neo-tree in the current window (NOT a sidebar)
        require("neo-tree.command").execute({
          toggle = true,
          position = "current", -- critical: replace current buffer instead of side panel
        })
      end,
      desc = "NeoTree (navigator mode)",
    },

    -- Sidebar mode (explicit)
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({
          toggle = true,
          position = "left", -- traditional vertical tree on the left
          reveal = true,
        })
      end,
      desc = "NeoTree (sidebar mode)",
    },
  },
}

