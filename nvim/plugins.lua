local plugins = {
  -- UI:
  { 'scrooloose/nerdtree', On='NERDTreeToggle' },
  'flazz/vim-colorschemes',
  'airblade/vim-gitgutter',

  -- Statusline:
  'itchyny/lightline.vim',
  'mgee/lightline-bufferline',

  -- Utilies:
  'christoomey/vim-system-copy',
  'jamessan/vim-gnupg',
  { 'junegunn/fzf', Dir='~/.fzf', Do='./install --all' },
  'junegunn/fzf.vim', -- General-purpose fuzzy-matching

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
  { 'rust-lang/rust.vim' },
  { 'racer-rust/vim-racer' },

}

-- Source all plugins
local swaps = {
  ['For'] = 'for',
  ['Do'] = 'do',
  ['Dir'] = 'dir',
  ['On'] = 'on',
}
vim.api.nvim_call_function('plug#begin', {PLUGIN_DIRECTORY})
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
