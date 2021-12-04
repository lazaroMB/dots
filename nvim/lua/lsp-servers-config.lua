function on_attach (client)
  if client.name ~= 'efm' then
      client.resolved_capabilities.document_formatting = false
  end

  if client.resolved_capabilities.document_formatting then
      vim.cmd [[
      augroup Format
      au! * <buffer>
      au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 2000)
      augroup END
      ]]
  end
end

require'lspconfig'.tsserver.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach
}

require'lspconfig'.vimls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.bashls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.dotls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.tailwindcss.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  settings = {
    tailwindCSS = {
      classAttributes = { 'class' , 'className' , 'classList' }
    }
  }
}

require'lspconfig'.html.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.sqlls.setup{
  cmd = {'sql-language-server', 'up', '--method', 'stdio'},
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

require'lspconfig'.cssls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- EFM
local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

local prettier = { formatCommand = 'npx prettier --stdin-filepath ${INPUT}', formatStdin = true }

local config = {
  css = { prettier },
  html = { prettier },
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  json = { prettier },
  markdown = { prettier },
  scss = { prettier },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
}

require'lspconfig'.efm.setup{
  init_options = {documentFormatting = true},
  filetypes = vim.tbl_keys(config),
  settings = {
      rootMarkers = {".git/"},
      languages = config
  },
  on_attach = on_attach,
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

-- Emmet
local lspconfig = require'lspconfig'
local configs = require'lspconfig/configs'

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
      default_config = {
          cmd = {'emmet-ls', '--stdio'};
          filetypes = {'html', 'css', 'typescriptreact'};
          root_dir = function(fname)
              return vim.loop.cwd()
          end;
          settings = {};
      };
  }
end
require'lspconfig'.emmet_ls.setup{
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
}
