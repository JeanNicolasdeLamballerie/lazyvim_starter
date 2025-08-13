return {
  {
    "Diogo-ss/42-header.nvim",
    cmd = { "Stdheader" },
    keys = { "<F1>" },
    opts = {
      auto_update = true, -- Update header when saving.
      user = "jean.nicolas-de-lamballerie", -- Your user.
      mail = "jean.nicolas-de-lamballerie@learner.42.tech", -- Your mail.
      -- asciiart = { "##", "--" },
      -- add other options.
    },
    config = function(_, opts)
      require("42header").setup(opts)
    end,
  },

  {
    "Diogo-ss/42-C-Formatter.nvim",
    cmd = "CFormat42",
    config = function()
      local formatter = require("42-formatter")
      formatter.setup({
        formatter = "c_formatter_42",
        filetypes = { c = true, h = true, cpp = true, hpp = true },
      })
    end,
  },
}
