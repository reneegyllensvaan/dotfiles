local parsers = require "nvim-treesitter.parsers"
local queries = require'nvim-treesitter.query'
local ts_utils = require'nvim-treesitter.ts_utils'

local hlmap = vim.treesitter.highlighter.hl_map

local M = {}

function M.show_hl_captures()
  local bufnr = vim.api.nvim_get_current_buf()
  local lang = parsers.get_buf_lang(bufnr)

  if not lang then return end

  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  row = row - 1

  local parser = parsers.get_parser(bufnr, lang)
  if not parser then return function() end end

  local root = parser:parse():root()
  if not root then return end
  local start_row, _, end_row, _ = root:range()

  local matches = {}
  local query = queries.get_query(lang, 'highlights')
  for _, match in query:iter_matches(root, bufnr, start_row, end_row) do
    for id, node in pairs(match) do
      if ts_utils.is_in_node_range(node, row, col) then
        local c = query.captures[id] -- name of the capture in the query
        if c ~= nil then
          table.insert(matches, '@'..c..' -> '..(hlmap[c] or 'nil'))
        end
      end
    end
  end
  if #matches == 0 then
    matches = {"No tree-sitter matches found!"}
  end
  vim.lsp.util.open_floating_preview(matches, "treesitter-hl-captures")
end

return M
