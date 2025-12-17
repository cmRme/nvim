require("mason").setup()

-- CLI-инструменты (форматтеры/линтеры) через Mason
require("mason-tool-installer").setup({
  ensure_installed = {
    -- formatters (Conform)
    "prettier",
    "stylua",
    "black",
    "isort",

    -- (опционально) linters
    "eslint_d",
  },
  auto_update = false,
  run_on_start = true,
})

-- LSP-сервера через Mason
require("mason-lspconfig").setup({
  ensure_installed = {
    "pyright",
    "ts_ls",
    "html",
    "cssls",
    "rust_analyzer",
    "gopls",
    "lua_ls",
    "json_ls",
  },
})

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client, bufnr)
  -- Отключаем форматирование LSP и использум внешний форматтер (Conform)
  local disable_format = {
      ts_ls = true,
      html = true,
      cssls = true,
      jsonls = true,
      lua_ls - true,
  }

  if disable_format[client.name] then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
  end

  local opts = { buffer = bufnr, noremap = true, silent = true }  -- набор опций для LSP-кеймапов
  
  -- Навигация
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Рефакторинг
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

  -- Диагностика
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)
  
  -- Форматирование: Conform (не LSP), чтобы не было конфликтов
  vim.keymap.set({ "n", "v" }, "<leader>f", function()
    local ok, conform = pcall(require, "conform")
    if ok then
      conform.format({ lsp_fallback = true, timeout_ms = 2000 })
    else
      -- запасной вариант, если conform почему-то не загрузился
      vim.lsp.buf.format({ async = true })
    end
  end, opts)
end

-- Серверы, которые реально настраиваем
local servers = { "pyright", "ts_ls", "html", "cssls", "rust_analyzer", "gopls", "lua_ls" }

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end
