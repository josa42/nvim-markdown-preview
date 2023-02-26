local M = {}

M.create_update_autocmd = function()
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.md' },
    command = 'silent! UpdatePreview',
  })
end

return M
