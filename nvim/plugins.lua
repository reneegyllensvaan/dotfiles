local plugins = {
  -- UI: { 'scrooloose/nerdtree', On='NERDTreeToggle' },
  'flazz/vim-colorschemes',
  'airblade/vim-gitgutter',
  'liuchengxu/vim-which-key', -- spacemacs-style leader hints
  'itchyny/lightline.vim',
  'majutsushi/tagbar',
  'chriskempson/base16-vim',

  -- Utilies:
  'christoomey/vim-system-copy',
  'jamessan/vim-gnupg',

  -- { 'junegunn/fzf', Dir='~/.fzf', Do='./install --all' },
  -- 'junegunn/fzf.vim', -- General-purpose fuzzy-matching
  { 'lotabout/skim', Dir='~/.skim', Do='./install' },
  'lotabout/skim.vim',

  { 'junegunn/goyo.vim', On='Goyo' }, -- `:Goyo` to enter distraction-free mode
  { 'vim-scripts/loremipsum', On='Lorem' }, -- `:Lorem [words]` to generate placeholder text
  'tomtom/tcomment_vim', -- `gc` as a comment operator
  'scrooloose/nerdcommenter',
  'tommcdo/vim-lion',
  'editorconfig/editorconfig-vim', -- Use .editorconfig files

  -- Editing
  'michaeljsmith/vim-indent-object', -- enables `vii` and `vai`
  'tpope/vim-surround',
  'terryma/vim-multiple-cursors',
  'jiangmiao/auto-pairs',

  -- Language:
  -- Language Support Plugins
  'jceb/vim-orgmode',
  { 'rust-lang/rust.vim', For='rust' },
  { 'mxw/vim-jsx', },
  { 'zah/nim.vim', For='nim' },
  { 'fatih/vim-go', Do=':GoUpdateBinaries', For='go' },
  { 'pangloss/vim-javascript', For={'javascript', 'javascript.jsx'} },
  { 'davidhalter/jedi-vim', For='python' },
  -- Deoplete (completion)
  { 'shougo/deoplete.nvim', For={'python', 'nim', 'javascript', 'javascript.jsx', 'rust'} },
  { 'zchee/deoplete-jedi', For='python' },
  { 'carlitux/deoplete-ternjs', For={'javascript', 'javascript.jsx'} },
  { 'racer-rust/vim-racer', For='rust' },
  { 'sebastianmarkow/deoplete-rust', For='rust' },
  { 'reasonml-editor/vim-reason-plus', For='reason' },
  {  'suan/vim-instant-markdown', For='markdown' },

  -- Other
  { 'shougo/neosnippet.vim', For={'python', 'nim', 'javascript', 'javascript.jsx'} },
  { 'w0rp/ale', For={'python', 'nim', 'javascript', 'javascript.jsx', 'rust'} },
  -- Other, but language specific
  { 'xuhdev/vim-latex-live-preview', For='tex' },
  { 'mattn/emmet-vim'},

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
