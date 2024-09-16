return {
  -- Put the command line where it belongs instead of
  -- floating it in the middle of the screen.
  {
    "folke/noice.nvim",
    opts = {
      cmdline = {
        view = "cmdline",
      },
    },
  },

  -- Needed this for ec-cli, can't remember exactly why
  {
    "neovim/nvim-lspconfig",
    gopls = {
      setup = {
        settings = {
          gopls = {
            buildFlags = { "-tags=unit" },
          },
        },
      },
    },
  },
}
