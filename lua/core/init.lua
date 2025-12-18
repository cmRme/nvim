-- Basic Settings
vim.g.mapleader = " " -- Leader
-- vim.opt.shell = "/bin/bash"            -- Shell по умолчанию
vim.opt.swapfile = false -- Отключить swap файлы nvim
vim.opt.encoding = "utf-8" -- Кодировка utf-8
vim.opt.fileencoding = "utf-8" -- Кодировка файлов
vim.opt.cursorline = false -- Выделять активную строку где находится курсор
vim.opt.fileformat = "unix"
vim.opt.termguicolors = true

-- Line Numbers
vim.opt.number = true

-- Mouse
vim.opt.mouse = "a" -- Возможность использовать мышку
vim.opt.mousefocus = true

-- Nvim-Tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Разрешить общий буфер обмена

-- Indent Settings
vim.opt.expandtab = true -- Превратить все tab в пробелы
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true -- Копировать отступ на новой строке

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Search
vim.opt.ignorecase = true -- Игнорировать регистр при поиске
vim.opt.smartcase = true -- Не игнорирует регистр если в паттерне есть большие буквы
vim.opt.hlsearch = true -- Подсвечивает найденный паттерн
vim.opt.incsearch = true -- Интерактивный поиск
vim.opt.signcolumn = "yes:1" -- фиксация signcolumn (чтобы не дергался экран)
