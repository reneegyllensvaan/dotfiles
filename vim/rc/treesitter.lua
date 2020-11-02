require'nvim-treesitter.configs'.setup {

  highlight = {
    enable = true,
    use_languagetree = false, -- Use this to enable language injection (this is very unstable)
    disable = {
      -- 'markdown',
    },
    custom_captures = {  -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      -- ["keyword.void"] = "TSTypeBuiltin",
    },
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  }

}

