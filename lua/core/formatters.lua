-- lua/core/formatters.lua
-- Conform + Mason: единое форматирование (format-on-save + ручной формат)
-- Требования:
-- 1) В core/plugins.lua подключён "stevearc/conform.nvim"
-- 2) В core/lsp.lua через mason-tool-installer установлены formatters (prettier, stylua, black, isort, ...)

local ok, conform = pcall(require, "conform")
if not ok then
	return
end

-- Важно: чтобы Neovim видел бинарники Mason (…/nvim-data/mason/bin)
-- Обычно mason сам добавляет shims, но это делает поведение 100% стабильным.
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. (vim.env.PATH or "")

conform.setup({
	-- Форматтеры по filetype
	formatters_by_ft = {
		-- Lua (Neovim config)
		lua = { "stylua" },

		-- Web
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },

		-- Python
		python = { "isort", "black" },
	},

	-- Настройка конкретных форматтеров (опционально)
	-- Пример: prettier с prefer_local позволит использовать node_modules/.bin/prettier, если он есть,
	-- иначе — fallback на глобальный (в т.ч. mason).
	formatters = {
		prettier = {
			-- Если хочешь строго Mason-prettier, убери prefer_local
			prefer_local = "node_modules/.bin",
		},
	},

	-- Автоформат при сохранении
	format_on_save = function(bufnr)
		-- Можно отключать формат on save для отдельных файлов/типов
		local ft = vim.bo[bufnr].filetype
		local disable_ft = {
			-- пример:
			-- c = true,
			-- cpp = true,
		}
		if disable_ft[ft] then
			return
		end

		return {
			timeout_ms = 20000,
			lsp_fallback = true, -- если не найден внешний форматтер, попробовать LSP
			async = false,
		}
	end,
})

-- (Опционально) Команда для ручного форматирования
vim.api.nvim_create_user_command("Format", function()
	conform.format({ lsp_fallback = true, timeout_ms = 2000 })
end, { desc = "Format current buffer (Conform)" })

-- Примечание по согласованности с LSP:
-- В твоём core/lsp.lua ты отключаешь documentFormattingProvider у серверов (ts_ls/html/cssls/lua_ls),
-- поэтому Conform будет "главным", а lsp_fallback сработает только там, где LSP-формат не отключён
-- и/или где нет внешнего форматтера.
