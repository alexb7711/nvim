-- Org Mode
--
-- https://github.com/nvim-orgmode/orgmode
--

--------------------------------------------------------------------------------
-- LAZY SETUP
---------------------------------------------------------------------------------
local org = {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
}

---------------------------------------------------------------------------------
-- CONFIGURATION
----------------------------------------------------------------------------------
function org.config()
  -- Setup orgmode
  require("orgmode").setup({
    org_agenda_files = "~/orgfiles/**/*",
    org_default_notes_file = "~/orgfiles/refile.org",
  })
end

return org
