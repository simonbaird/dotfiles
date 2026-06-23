-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- Function to stop gopls for gotmpl file types
--
-- Fixme: this is not quite right, but it might help figure out the right solution
--
local function stop_gopls_for_gotmpl(_)
  -- Get all active clients
  local clients = vim.lsp.get_active_clients()
  for _, client in ipairs(clients) do
    if client.name == "gopls" then
      client.stop()
    end
  end
end

-- Create an autocmd for gotmpl file type to stop gopls
vim.api.nvim_create_autocmd("FileType", {
  pattern = "gotmpl",
  callback = function(args)
    stop_gopls_for_gotmpl(args.buf)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

-- Do we really need line numbers?
vim.opt.number = true
vim.opt.relativenumber = false

-- Save my sanity
vim.opt.fixendofline = false

-- Let's not
vim.opt.mouse = ""
vim.opt.clipboard = ""

-- Enable modelines
vim.o.modeline = true

-- Line number colors
vim.cmd([[
  augroup CustomLineNrColors
    autocmd!
    autocmd ColorScheme * highlight LineNr guifg=#000000
    autocmd ColorScheme * highlight CursorLineNr guifg=#333333
  augroup END
]])

-- Default option here also includes t:block-blinkon500-blinkoff500-TermCursor
-- which leaks out into the terminal when you're using Ghostty being Ghostty is
-- very strict about following the standard to the letter (or something).
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
