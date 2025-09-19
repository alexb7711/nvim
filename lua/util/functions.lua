-- =============================================================================
-- This function checks if an item exists in a list
--
-- @pram list List to be searched
-- @param item Item to search for
--
-- @return True if item is found, false otherwise
--
function lhas (list, item)
  for _, value in ipairs(list) do
    if value == target_item then return true end
  end
  return false
end

-- =============================================================================
-- This function trims whitespace from end of lines
--
function whitespace_trim()
   local save_cursor = vim.fn.getpos(".")
   vim.cmd([[keeppatterns %substitute/\v\s+$//eg]])
   vim.fn.setpos(".", save_cursor)
   vim.cmd('write')
end

