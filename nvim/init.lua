local options  =  {
  guioptions = '',                -- Remove scrollbars in gvim
  -- Indentation
  autoindent = true,              -- Indent according to previous line.
  expandtab = true,               -- Use spaces instead of tabs.
  softtabstop = 2,                -- Tab key indents by 2 spaces.
  shiftwidth = 2,                 -- >> indents by 2 spaces.
  shiftround = true,              -- >> indents to next multiple of 'shiftwidth'.

  backspace = 'indent,eol,start', -- Make backspace work as you would expect.
  hidden = true,                  -- Switch between buffers without having to save first.
  display = lastline,             -- Show as much as possible of the last line.
  showmode = true,                -- Show current mode in command-line.
  showcmd = true,                 -- Show already typed keys when more are expected.
  incsearch = true,               -- Highlight while searching with / or ?.
  hlsearch = true,                -- Keep matches highlighted.
  infercase = true,               -- Case-insensitive completion
  ignorecase = true,              -- Case-insensitive search
  ttyfast = true,                 -- Faster redrawing.
  lazyredraw = true,              -- Only redraw when necessary.
  splitbelow = true,              -- Open new windows below the current window.
  splitright = true,              -- Open new windows right of the current window.
  cursorline = true,              -- Find the current line quickly.
  wrapscan = true,                -- Searches wrap around end-of-file.
  report = 0,                     -- Always report changed lines.
  synmaxcol = 200,                -- Only highlight the first 200 columns.
  timeoutlen = 100,               -- Timeout for code updates
  ttimeoutlen = 0,                -- Timeout for mode updates
  so = 999,                       -- Always center cursor
  inccommand = 'nosplit',         -- Show :%?s///g? replacements in place
  list = true,                    -- Show non-printable characters
}

for k, v in pairs(options) do
  vim.api.set_option(k, v)
end

