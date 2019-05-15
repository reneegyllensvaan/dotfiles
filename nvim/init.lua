local plugin_directory = '~/.local/share/nvim/plugged'
local homedir = os.getenv('HOME')

local options  =  {
  -- guioptions = '',                -- Remove scrollbars in gvim
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

  -- Put all internal files under the same directory.
  backup      = true,
  backupdir   = homedir..'/.local/share/nvim/files/backup/',
  backupext   = '-vimbackup',
  backupskip  = '',
  directory   = homedir..'/.local/share/nvim/files/swap//',
  updatecount = 100,
  undofile    = true,
  undodir     = homedir..'/.local/share/nvim/files/undo/',
  viminfo     = '\'100,n'..homedir..'/.local/share/nvim/files/info/viminfo',
}

local plugins = {
  -- UI:
  { 'scrooloose/nerdtree', On='NERDTreeToggle' },
  'flazz/vim-colorschemes',
  'Vigemus/nvimux',
  'airblade/vim-gitgutter',

  -- Statusline:
  'itchyny/lightline.vim',
  'mgee/lightline-bufferline',

  -- Utilies:
  'christoomey/vim-system-copy',
  'jamessan/vim-gnupg',
  { 'junegunn/fzf', Dir='~/.fzf', Do='./install --all' },
  'junegunn/fzf.vim', -- General-purpose fuzzy-matching
  'ctrlpvim/ctrlp.vim',

  -- Toolbox:
  'liuchengxu/vim-which-key', -- spacemacs-style leader hints
  { 'junegunn/goyo.vim', On='Goyo' }, -- `:Goyo` to enter distraction-free mode
  { 'vim-scripts/loremipsum', On='Lorem' }, -- `:Lorem [words]` to generate placeholder text
  'tomtom/tcomment_vim', -- `gc` as a comment operator
  'editorconfig/editorconfig-vim', -- Use .editorconfig files
  'michaeljsmith/vim-indent-object', -- enables `vii` and `vai`
  'tpope/vim-surround',

  -- Language Support:
  -- General
  { 'shougo/deoplete.nvim' }, --, For={'python', 'nim', 'javascript', 'jsx'} },
  { 'shougo/neosnippet.vim', For={'python', 'nim'} },
  { 'w0rp/ale' }, --, For={'python', 'nim', 'javascript', 'jsx'} },
  -- Go
  { 'fatih/vim-go', Do=':GoUpdateBinaries', For='go' },
  -- Nim
  { 'zah/nim.vim', For='nim' },
  -- Latex
  { 'xuhdev/vim-latex-live-preview', For='tex' },
  -- Python
  { 'davidhalter/jedi-vim', For='python' },
  { 'zchee/deoplete-jedi', For='python' },
  { 'pangloss/vim-javascript' }, --, For={'javascript', 'jsx'} },
  { 'mxw/vim-jsx' },--, For='jsx' },

}

-- -- Apply all options
for k, v in pairs(options) do
  vim.api.nvim_set_option(k, v)
end

-- Source all plugins
local swaps = {
  ['For'] = 'for',
  ['Do'] = 'do',
  ['Dir'] = 'dir',
  ['On'] = 'on',
}
vim.api.nvim_call_function('plug#begin', {plugin_directory})
for i,v in pairs(plugins) do
  if type(v) == 'string' then
    vim.api.nvim_call_function('plug#', {v})
  else
    local plugin = table.remove(v, 1) -- Pop the first arg to unnest it

    -- Translate upcased keys to lowercase
    for from, to in pairs(swaps) do
      v[to] = v[from]; v[from] = nil
    end
    if next(v) then -- If we also passed kwargs, then add them as a function arg
      vim.api.nvim_call_function('plug#', {plugin, v})
    else -- If we just passed the plugin repo, pass plugin along
      vim.api.nvim_call_function('plug#', {plugin})
    end
  end
end
vim.api.nvim_call_function('plug#end', {})
