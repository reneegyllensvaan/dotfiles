local variables = {

  'mapleader'                             = "\\<Space>",
  'maplocalleader'                        = ',',
  'auto_refresh_delay'                    = 0,
  -- Deoplete
  'deoplete#enable_at_startup'            = 1,
  'deoplete#auto_complete_delay'          = 0,
  'deoplete#sources#rust#show_duplicates' = 1,
  -- 'deoplete#ignore_sources             = {},
  -- 'deoplete#ignore_sources._           = ['buffer', 'around'],
  'deoplete#sources#ternjs#filetypes'     = {
    'jsx',
    'javascript.jsx',
    'vue',
  },
  -- Jedi
  'jedi#goto_command'                     = '<leader>gg',
  'jedi#goto_assignments_command'         = '<leader>ga',
  'jedi#goto_definitions_command'         = '<leader>gd',
  'jedi#documentation_command'            = 'K',
  'jedi#usages_command'                   = '<leader>n',
  'jedi#completions_command'              = '<C-Space>',
  'jedi#rename_command'                   = '<leader>r',
  'airline_powerline_fonts'               = 0,
  'neosnippet#disable_runtime_snippets'   = { '_' : 1 }, -- don't try to load default snippets
  'neosnippet#snippets_directory'         = ['~/.config/nvim/snippets'],

}
