-- Language servers are enabled automatically by mason-lspconfig once installed.
local servers = { "pyright", "ts_ls", "cssls", "html", "tailwindcss", "clangd", "lua_ls" }

-- Formatters and other tools installed through mason
local tools = { "stylua", "isort", "black", "prettierd", "clang-format", "tree-sitter-cli" }

return {
    {
        "mason-org/mason.nvim",
        lazy = false, -- adds mason binaries (tree-sitter, formatters) to PATH
        opts = {},
        config = function(_, opts)
            require("mason").setup(opts)
            local registry = require("mason-registry")
            registry.refresh(function()
                for _, name in ipairs(tools) do
                    local ok, pkg = pcall(registry.get_package, name)
                    if ok and not pkg:is_installed() then
                        pkg:install()
                    end
                end
            end)
        end,
    },

    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = servers,
            automatic_enable = { exclude = { "stylua" } }, -- stylua is used as a formatter via conform
        },
    },

    { -- lua_ls knows about the Neovim API while editing this config
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } },
        },
    },

    { -- completion
        "saghen/blink.cmp",
        version = "1.*",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {
            keymap = { preset = "default" }, -- <C-y> accept, <C-n>/<C-p> select, <C-space> open, <C-e> close
            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 300 },
                list = { selection = { preselect = false } },
            },
            signature = { enabled = true },
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                    lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 },
                },
            },
        },
    },

    { -- formatting
        "stevearc/conform.nvim",
        event = "BufWritePre",
        cmd = { "ConformInfo", "Format", "FormatDisable", "FormatEnable" },
        keys = {
            { "<Space>lI", function() require("conform").format({ async = true }) end, mode = { "n", "x" }, desc = "Format" },
        },
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "isort", "black" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
                css = { "prettierd" },
                html = { "prettierd" },
                json = { "prettierd" },
                c = { "clang-format" },
                cpp = { "clang-format" },
            },
            default_format_opts = { lsp_format = "fallback" },
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500 }
            end,
        },
        config = function(_, opts)
            require("conform").setup(opts)

            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = { start = { args.line1, 0 }, ["end"] = { args.line2, end_line:len() } }
                end
                require("conform").format({ async = true, range = range })
            end, { range = true })

            -- FormatDisable! disables formatting just for this buffer
            vim.api.nvim_create_user_command("FormatDisable", function(args)
                if args.bang then
                    vim.b.disable_autoformat = true
                else
                    vim.g.disable_autoformat = true
                end
            end, { desc = "Disable autoformat-on-save", bang = true })

            vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b.disable_autoformat = false
                vim.g.disable_autoformat = false
            end, { desc = "Re-enable autoformat-on-save" })
        end,
    },

    { -- LSP keymaps (on top of Neovim defaults: K, grn, gra, grr, gri, grt, gO)
        "neovim/nvim-lspconfig",
        lazy = true,
        init = function()
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
                    end

                    map("n", "gd", function() Snacks.picker.lsp_definitions() end, "Go to definition")
                    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("n", "<Space>ld", function() Snacks.picker.lsp_definitions() end, "Definition")
                    map("n", "<Space>lD", vim.lsp.buf.declaration, "Declaration")
                    map("n", "<Space>li", function() Snacks.picker.lsp_implementations() end, "Implementation")
                    map("n", "<Space>lt", function() Snacks.picker.lsp_type_definitions() end, "Type definition")
                    map("n", "<Space>lH", function() Snacks.picker.lsp_references() end, "References")
                    map("n", "<Space>lh", vim.lsp.buf.hover, "Hover")
                    map("n", "<Space>ls", vim.lsp.buf.signature_help, "Signature help")
                    map("n", "<Space>lR", vim.lsp.buf.rename, "Rename")
                    map({ "n", "x" }, "<Space>lc", vim.lsp.buf.code_action, "Code action")
                    map("n", "<Space>lx", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
                    end, "Toggle inlay hints")
                end,
            })
        end,
    },
}
