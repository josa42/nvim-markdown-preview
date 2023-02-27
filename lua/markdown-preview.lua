local M = { vim.o.filetype }

M.create_update_autocmd = function()
  vim.api.nvim_create_autocmd('BufEnter', {
    pattern = { '*.md' },
    command = 'silent! UpdatePreview',
  })

  vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    pattern = '*.md',
    callback = function()
      local cur = vim.api.nvim_win_get_cursor(0)[1]
      local lines = #vim.api.nvim_buf_get_lines(0, 0, -1, false)
      vim.lsp.buf.execute_command({
        command = 'mardown-preview.scroll',
        arguments = {
          {
            position = (cur - 1) / (lines - 1),
            textDocument = vim.lsp.util.make_text_document_params(0),
          },
        },
      })
    end,
  })
end

return M
