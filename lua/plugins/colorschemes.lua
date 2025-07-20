local gruvboxopts = {}
local tokyonightopts = {
  style = "moon",
}
-- todo torte
local transparent = os.getenv("TRANSPARENT_BACKGROUND") or "false"
if transparent == "true" then
  gruvboxopts.transparent_mode = true
  tokyonightopts.styles = {
    transparent = true,
    sidebars = "transparent",
    float = "transparent",
  }
end
local transparent_neovide = os.getenv("NEOVIDE_TRANSPARENT_GRADIENT") or "1"
if transparent == "true" and transparent_neovide == "1" then
  transparent_neovide = "0.75"
end
-- local transparent_neovide_window = os.getenv("NEOVIDE_WINDOW_TRANSPARENT_GRADIENT") or "1"
local colorscheme = os.getenv("NVIM_COLORSCHEME") or "gruvbox"
-- local window_nopacity = tonumber(transparent_neovide_window) or 0.7
local nopacity = tonumber(transparent_neovide) or 1
-- vim.g.neovide_opacity = window_nopacity
vim.g.neovide_normal_opacity = nopacity

return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = tokyonightopts,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    name = "everforest",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    tag = "v2.0.1",
    opts = {
      theme = {
        style = "dark", --  "dark" | "light"
        contrast = "default", -- "default" | "high"
        transparent = false, -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "pink", -- "pink" | "cyan" | "yellow" | "orange" | "green"
        custom = {
          saturation = "", -- "" | string representing an integer between 0 and 100
          light = "", -- "" | string representing an integer between 0 and 100
        },
      },
      ui = {
        borders = "inverse", -- "theme" | "inverse" | "fluo" | "none"
        aggressive_spell = false, -- true | false
      },
    },
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    -- init = function()
    -- vim.cmd.colorscheme("lackluster")
    -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
    -- vim.cmd.colorscheme("lackluster-mint")
    -- end,
  },
  { "miikanissi/modus-themes.nvim", lazy = false, priority = 1000 },
  {
    "zootedb0t/citruszest.nvim",
    lazy = false,
    priority = 1000,
  },
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = gruvboxopts,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        fzf = true,
        grug_far = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        snacks = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
    specs = {
      {
        "akinsho/bufferline.nvim",
        optional = true,
        opts = function(_, opts)
          if (vim.g.colors_name or ""):find("catppuccin") then
            opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
          end
        end,
      },
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    lazy = false,
    opts = {
      colorscheme = colorscheme,
      -- icons = {
      --   misc = {
      --     dots = "󰇘",
      --   },
      --   ft = {
      --     octo = "",
      --   },
      --   dap = {
      --     Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
      --     Breakpoint = " ",
      --     BreakpointCondition = " ",
      --     BreakpointRejected = { " ", "DiagnosticError" },
      --     LogPoint = ".>",
      --   },
      --   diagnostics = {
      --     Error = " ",
      --     Warn = " ",
      --     Hint = " ",
      --     Info = " ",
      --   },
      --   git = {
      --     added = " ",
      --     modified = " ",
      --     removed = " ",
      --   },
      --   kinds = {
      --     Array = " ",
      --     Boolean = "󰨙 ",
      --     Class = " ",
      --     Codeium = "󰘦 ",
      --     Color = " ",
      --     Control = " ",
      --     Collapsed = " ",
      --     Constant = "󰏿 ",
      --     Constructor = " ",
      --     Copilot = " ",
      --     Enum = " ",
      --     EnumMember = " ",
      --     Event = " ",
      --     Field = " ",
      --     File = " ",
      --     Folder = " ",
      --     Function = "󰊕 ",
      --     Interface = " ",
      --     Key = " ",
      --     Keyword = " ",
      --     Method = "󰊕 ",
      --     Module = " ",
      --     Namespace = "󰦮 ",
      --     Null = " ",
      --     Number = "󰎠 ",
      --     Object = " ",
      --     Operator = " ",
      --     Package = " ",
      --     Property = " ",
      --     Reference = " ",
      --     Snippet = "󱄽 ",
      --     String = " ",
      --     Struct = "󰆼 ",
      --     Supermaven = " ",
      --     TabNine = "󰏚 ",
      --     Text = " ",
      --     TypeParameter = " ",
      --     Unit = " ",
      --     Value = " ",
      --     Variable = "󰀫 ",
      --   },
      -- },
      ---@type table<string, string[]|boolean>?
      kind_filter = {
        default = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          "Package",
          "Property",
          "Struct",
          "Trait",
        },
        markdown = false,
        help = false,
        -- you can specify a different filter for each filetype
        lua = {
          "Class",
          "Constructor",
          "Enum",
          "Field",
          "Function",
          "Interface",
          "Method",
          "Module",
          "Namespace",
          -- "Package", -- remove package since luals uses it for control flow structures
          "Property",
          "Struct",
          "Trait",
        },
      },
    },
  },
}
