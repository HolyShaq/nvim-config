-- Options
vim.g.have_nerd_font = true -- Nerd Font
vim.opt.number = true -- Show line number
vim.opt.relativenumber = true -- Show relative line number
vim.opt.mouse = 'a' -- Enable mouse for all modes
vim.opt.undofile = true -- Save undo history
vim.opt.signcolumn = 'yes' -- Sign column
vim.opt.cursorline = true -- Highlight current line
vim.opt.showmode = false -- Hide mode
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.inccommand = 'split' -- Live preview of substitutions
vim.opt.wildmenu = true -- Enable wildmenu
vim.opt.wildmode = 'longest:full,full' -- Wildmenu options

-- Keep 10 lines above and below the cursor
vim.opt.scrolloff = 10

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
