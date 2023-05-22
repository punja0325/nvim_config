-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to jj
map('i', 'jj', '<Esc>')
-- Clear search highlighting with <leader> and c
map('n', '<Leader>c', ':nohl<cr>')

--Splits windows by <Leader> and sv
map('n', '<Leader>sv', '<C-w>v')
--Close windows by <Leader> and sx
map('n', '<Leader>sx', ':close<cr>')
-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')
-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')
-- Fast saving with <leader> and s
map('n', '<leader>s', ':w<CR>')
-- Close all windows and exit from Neovim with <leader> and q
map('n', '<leader>q', ':qa<CR>')


-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<leader>n', ':NvimTreeFindFile<CR>')      -- search file


-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})             -- find files within current working directory, respects .gitignore
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})              -- find string in current working directory as you type
vim.keymap.set('n', '<leader>fc', builtin.grep_string, {})            -- find string under cursor in current working directory
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})                -- list open buffers in current neovim instance
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})              -- list available help tags
vim.keymap.set('n', '<leader>lds', builtin.lsp_document_symbols, {})  -- list all functions/structs/classes/modules in the current buffer

-- Telescope git commands
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})    -- list all git commits (use <cr> to checkout) ["gc" for git commits]
vim.keymap.set('n', '<leader>gfc', builtin.git_bcommits, {})  -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits] 
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})   -- list git branches (use <cr> to checkout) ["gb" for git branch]
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})     -- list current changes per file with diff preview ["gs" for git status]

---- hop cmd  --> Maybe easy-motion is more better
map('', '<leader>hw', ':HopWord<cr>')
map('', '<leader>hww', ':HopWordMW<cr>')   --Multi-window
map('', '<leader>hc', ':HopChar2<cr>')
map('', '<leader>hcc', ':HopChar2MW<cr>')  --Multi-window
map('', '<leader>hl', ':HopLine<cr>')
map('', '<leader>hls', ':HopLineStart<cr>')


-- <Leader>h{char} to move to {char}
--map('', '<leader>h', '<Plug>(easymotion-bd-f)')
map('', '<leader>hf', '<Plug>(easymotion-overwin-f)')   --Multi-window

 -- Comment
 -- comment/ uncomment by using 'gcc'
 -- comment/ uncomment next 6 line by using gc5j
 
 -- Vim-surround
 -- change surround ex. change " to ' -> cs"'
 -- delete surround ex. delete "  -> ds"
 -- Add surround in a word. -> ysiw]
 -- Add surround for here to B   ex. ysfB'
