
return {
  {
    name = "runner.nvim",
    dir = "~/dev/nvim-runner", -- local path, no git needed

    -- Optional but recommended: lazy-load on commands
    cmd = {
      "RunnerOpenTasks",
      "RunnerRunDefault",
      "RunnerOpenOutput",
      "RunnerEditGlobalConfig",
    },

    -- Optional: lazy-load on keys
    keys = {
      { "<leader>xr", "<cmd>RunnerOpenTasks<CR>" },
      { "<leader>XX", "<cmd>RunnerRunDefault<CR>" },
      { "<leader>xo", "<cmd>RunnerOpenOutput<CR>" },
      { "<leader>re", "<cmd>RunnerEditGlobalConfig<CR>" },
    },

    -- This is the important part:
    -- Lazy will do: require("runner").setup(opts)
    opts = {
      verbosity = 2,
      detection = {
        priority = { "just", "make", "cargo", "npm", "fallback" },
      },
    },
  },
}
