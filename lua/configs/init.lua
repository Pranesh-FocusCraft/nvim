-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  pattern = '*',
})


require 'configs.setTelescope'
require 'configs.setTreesitter'
require 'configs.config_lsp'
require 'configs.nvim_cmp'
