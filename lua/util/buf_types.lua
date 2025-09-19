-- =============================================================================
-- Programming Languages
-- =============================================================================
ProgBuf = {
   -- C/C++
  '*.c', '*.cpp',
  '*.h', '*.hpp',
  -- Rust 
  '*.rs',
  -- Interpreted Languages
  '*.lua', '*.vim',
  '*.m', '.oct',
  '*.py',
  '*.sh',
  -- Configuration and Serialization
  '*.toml', '*.yml', '*.json',
  -- Build tools
  'makefile', 'Makefile', '*.mk', '*.make',
  'CmakeLists.txt',
}

ProFileType = {
   -- C/C++
   'c', 'cpp',
   -- Build tools
   'cmake','make',
   -- Rust
   'rust',
   -- Configuration and Serialization
   'toml', 'yaml', 'json',
   -- Interpreted Languages
   'vim', 
   'java', 
   'python',
   -- HTML
   'css','html','javascript','xml'
}

-- =============================================================================
-- Markup/Writing Languages
-- =============================================================================
DocBuf = {
  '*.md',
  '*.tex',
  '*.txt',
}

DocFileType= {
   'markdown',
   'promela', 
   'tex'
}
