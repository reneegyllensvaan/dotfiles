-- Root which-key mappings
local keymap = {
  { '/', 'Rg', 'ripgrep' },
  { ' ', 'Commands', 'fzf-commands' },
}

-- Tabs:
keymap.l = {
  name='+tabs',
  {'n', 'tabnew', 'tabnew' },
  {'k', 'tabprevious', 'tabprevious' },
  {'j', 'tabnext', 'tabnext' },
}

-- Project:
keymap.p = {
  name='+project',
  { 'f', 'FzfProjectFiles', 'fzf-project-files' },
}

-- Files:
keymap.f = {
  name='+file',
  { 't', 'NERDTreeToggle', 'nerdtree' },
}

-- Vim:
keymap.V = {
  name='+Vim',
  { 'e', ':@*', 'eval-region'},
}

keymap.g = {
  name='+toggle',
  {'s',':!git status', 'git-status' },
}

keymap.t = {
  name='+toggle',
  { 'n', 'ToggleLineNumbers', 'toggle-line-numbers' },
  { 'E', 'ALEToggle', 'toggle-linter' },
  g={
    name='+git',
    { 'd', 'GitGutterBufferToggle', 'gitgutter (buffer)' },
    { 'D', 'GitGutterToggle', 'gitgutter (global)' },
  }, -- g
  c={
    name='center/cursor',
    {  'b', 'Goyo', 'toggle-goyo' },
    {  'l', ':set cursorline!', 'toggle-cursorline' },
  }, -- c
}

keymap.w = {
  name='+windows',
  { 'w' , '<C-W>w', 'other-window' },
  { 'd' , '<C-W>c', 'delete-window' },
  { '-' , '<C-W>s', 'split-window-below' },
  { '/' , '<C-W>v', 'split-window-right' },
  { '2' , '<C-W>v', 'layout-double-columns' },
  { 'h' , '<C-W>h', 'window-left' },
  { 'j' , '<C-W>j', 'window-below' },
  { 'l' , '<C-W>l', 'window-right' },
  { 'k' , '<C-W>k', 'window-up' },
  { 'H' , '<C-W>5<', 'expand-window-left' },
  { 'G' , 'GoldenRatioToggle', 'expand-window-left' },
  { 'J' , 'resize +5', 'expand-window-below' },
  { 'L' , '<C-W>5>', 'expand-window-right' },
  { 'K' , 'resize -5', 'expand-window-up' },
  { '=' , '<C-W>=', 'balance-window' },
  { 's' , '<C-W>s', 'split-window-below' },
  { 'v' , '<C-W>v', 'split-window-below' },
  { '?' , 'Windows', 'fzf-window' },
}

keymap.b = {
  name='+buffer',
  { '1' , 'b1', 'buffer 1' },
  { '2' , 'b2', 'buffer 2' },
  { 'd' , ':bp|bd', 'delete-buffer' },
  { 'f' , 'bfirst', 'first-buffer' },
  { 'h' , 'Startify', 'home-buffer' },
  { 'l' , 'blast', 'last-buffer' },
  { 'n' , 'bnext', 'next-buffer' },
  { 'p' , 'bprevious', 'previous-buffer' },
  { 'b' , 'Buffers', 'fzf-buffer' },
}

function make_which_key_tree (key, value)
  local subtree = {}
  for k, v in pairs(value) do
    if k == 'name' then -- special case for name key
      subtree['name'] = v
    elseif type(k) == 'number' then -- positional argument: key binding
      subtree[v[1]]={v[2], v[3]}
    elseif type(v) == 'table' then -- value is a subtree: recurse
      subtree[k] = make_which_key_tree(k, v)
    end
  end
  return subtree
end

local key_tree = make_which_key_tree(nil, keymap)

-- -- Uncomment this paragraph to dump the table to minibuffer before applying
-- function render_table (tb, indent)
--   for k,v in pairs(tb) do
--     if type(v) == 'table' then
--       print(indent..k..': (table)')
--       render_table(v, '    '..indent)
--     else
--       print(indent..k..': '..v)
--     end
--   end
-- end
-- render_table(key_tree, '')

vim.api.nvim_set_var('which_key_map', make_which_key_tree(nil, keymap))

