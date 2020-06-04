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
  'vimwiki/vimwiki',

  -- { 'junegunn/fzf', Dir='~/.fzf', Do='./install --all' },
  --'junegunn/fzf.vim', -- General-purpose fuzzy-matching
  { 'lotabout/skim', Dir='~/.skim', Do='./install' },
  { 'lotabout/skim.vim' },

  'tomtom/tcomment_vim', -- `gc` as a comment operator
  'scrooloose/nerdcommenter',
  'tommcdo/vim-lion',
  'editorconfig/editorconfig-vim', -- Use .editorconfig files

  -- Editing
  'michaeljsmith/vim-indent-object', -- enables `vii` and `vai`
  'tpope/vim-surround',
  'terryma/vim-multiple-cursors',
  'jiangmiao/auto-pairs',
  { 'eraserhd/parinfer-rust', For={'janet'} },

  -- Language:
  -- Language Support Plugins
  'jceb/vim-orgmode',
  { 'zah/nim.vim', For='nim' },
  -- { 'pangloss/vim-javascript', For={'javascript', 'javascript.jsx'} },
  -- { 'rust-lang/rust.vim', For='rust' },
  { 'mxw/vim-jsx', },
  -- { 'davidhalter/jedi-vim', For='python' },

  {'neoclide/coc.nvim', branch='release' },


  -- Other
  { 'shougo/neosnippet.vim', For={'python', 'nim', 'javascript', 'javascript.jsx'} },
  --{ 'w0rp/ale', For={'python', 'nim', 'javascript', 'javascript.jsx', 'rust', 'go'} },
  -- Other, but language specific
  --{ 'mattn/emmet-vim'},

  --{ 'git@github.com:janet-lang/janet.vim.git' },
  --{'Vigemus/iron.nvim'},
  --{'clojure-vim/acid.nvim'}

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
