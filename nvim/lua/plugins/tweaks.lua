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

  {
    "stevearc/conform.nvim",
    opts = function()
      local opts = {
        default_format_opts = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
          lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
          lua = { "stylua" },
          fish = { "fish_indent" },
          -- sh = { "shfmt" },
        },
        -- The options you set here will be merged with the builtin formatters.
        -- You can also define any custom formatters here.
        formatters = {
          injected = { options = { ignore_errors = true } },
          -- # Example of using dprint only when a dprint.json file is present
          -- dprint = {
          --   condition = function(ctx)
          --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
          --   end,
          -- },
          --
          -- # Example of using shfmt with extra args
          -- shfmt = {
          --   prepend_args = { "--indent", "4", "--space-redirects" },
          -- },
        },
      }
      return opts
    end,
  },
}
