local util = require('lspconfig.util')
local bin_name = 'markdown-preview-ls'

return {
  default_config = {
    cmd = { bin_name },
    filetypes = { 'markdown' },
    root_dir = util.root_pattern('README.md', '.git'),
  },
  docs = {
    description = [[]],
    default_config = {
      root_dir = [[]],
    },
  },
  commands = {
    OpenPreview = {
      description = 'Open Markdown Preview',
      function()
        vim.lsp.buf.execute_command({
          command = 'mardown-preview.open',
          arguments = { { textDocument = vim.lsp.util.make_text_document_params(0) } },
        })
      end,
    },
    UpdatePreview = {
      description = 'Update Markdown Preview',
      function()
        vim.lsp.buf.execute_command({
          command = 'mardown-preview.update',
          arguments = { { textDocument = vim.lsp.util.make_text_document_params(0) } },
        })
      end,
    },
    ClosePreview = {
      description = 'Close Markdown Preview',
      function()
        vim.lsp.buf.execute_command({
          command = 'mardown-preview.close',
          arguments = {},
        })
      end,
    },
  },
}
