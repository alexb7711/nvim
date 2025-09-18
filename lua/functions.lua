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
