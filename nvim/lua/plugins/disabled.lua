return {
  -- Disable mini.pairs because it's driving me crazy
  -- See also:
  -- * https://github.com/echasnovski/mini.pairs
  -- * https://www.reddit.com/r/neovim/comments/126g7q1/lazyvim_how_to_get_rid_of_an_unwanted_feature/
  { "echasnovski/mini.pairs", enabled = false },

  -- The vertical lines are useful sometimes but I prefer to reduce the visual clutter
  { "elukas-reineke/indent-blankline.nvim", enabled = false },
}
