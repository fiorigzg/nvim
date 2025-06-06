require('avante').setup({
    -- Provider configuration
    provider = "claude", -- "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot"
    auto_suggestions_provider = "claude",

    providers = {
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20241022",
            extra_request_body = {
                max_tokens = 4096,
                temperature = 0,
            },
        },
    },

    -- If you want to use OpenAI instead, uncomment below:
    -- openai = {
    --     endpoint = "https://api.openai.com/v1",
    --     model = "gpt-4o",
    --     timeout = 30000,
    --     temperature = 0,
    --     max_completion_tokens = 8192,
    -- },

    behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
        enable_token_counting = true,
    },

    mappings = {
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        cancel = {
            normal = { "<C-c>", "<Esc>", "q" },
            insert = { "<C-c>" },
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            retry_user_request = "r",
            edit_user_request = "e",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
            remove_file = "d",
            add_file = "@",
            close = { "<Esc>", "q" },
        },
    },

    hints = { enabled = true },

    windows = {
        position = "right", -- "right" | "left" | "top" | "bottom"
        wrap = true,        -- similar to vim.o.wrap
        width = 30,         -- default % based on available width
        sidebar_header = {
            enabled = true,
            align = "center", -- left, center, right
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8, -- Height of the input window in vertical layout
        },
        edit = {
            border = "rounded",
            start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
            floating = false,        -- Open the 'AvanteAsk' prompt in a floating window
            start_insert = true,     -- Start insert mode when opening the ask window
            border = "rounded",
            focus_on_apply = "ours", -- "ours" | "theirs"
        },
    },

    highlights = {
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },

    diff = {
        autojump = true,
        list_opener = "copen",
        override_timeoutlen = 500,
    },

    suggestion = {
        debounce = 600,
        throttle = 600,
    },
})


--
-- Additional keybindings (if auto_set_keymaps is false)
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Custom keybindings that work with your existing setup
keymap.set('n', '<Space>aa', '<Cmd>AvanteAsk<CR>', opts)            -- Ask AI about code
keymap.set('v', '<Space>aa', '<Cmd>AvanteAsk<CR>', opts)            -- Ask AI about selected code
keymap.set('n', '<Space>at', '<Cmd>AvanteToggle<CR>', opts)         -- Toggle sidebar
keymap.set('n', '<Space>ar', '<Cmd>AvanteRefresh<CR>', opts)        -- Refresh sidebar
keymap.set('n', '<Space>af', '<Cmd>AvanteFocus<CR>', opts)          -- Switch focus
keymap.set('n', '<Space>ae', '<Cmd>AvanteEdit<CR>', opts)           -- Edit selected blocks
keymap.set('v', '<Space>ae', '<Cmd>AvanteEdit<CR>', opts)           -- Edit selected blocks
keymap.set('n', '<Space>ah', '<Cmd>AvanteHistory<CR>', opts)        -- Chat history
keymap.set('n', '<Space>ac', '<Cmd>AvanteClear<CR>', opts)          -- Clear chat
keymap.set('n', '<Space>as', '<Cmd>AvanteStop<CR>', opts)           -- Stop current request
keymap.set('n', '<Space>ap', '<Cmd>AvanteSwitchProvider<CR>', opts) -- Switch provider
-- Simple function to add file under cursor in nvim-tree to Avante
keymap.set('n', '<Space>an', function()
    -- Works when cursor is on a file in nvim-tree
    local filetype = vim.bo.filetype
    if filetype == 'NvimTree' then
        local lib = require("nvim-tree.lib")
        local node = lib.get_node_at_cursor()
        if node and node.type == 'file' then
            local relative_path = vim.fn.fnamemodify(node.absolute_path, ':.')
            local sidebar = require('avante').get()
            if not sidebar:is_open() then
                require('avante.api').ask()
                sidebar = require('avante').get()
            end
            if sidebar.file_selector then
                sidebar.file_selector:add_selected_file(relative_path)
                vim.notify("Added " .. relative_path .. " to Avante chat")
            end
        else
            vim.notify("Please select a file in nvim-tree", vim.log.levels.WARN)
        end
    else
        vim.notify("Use this command when in nvim-tree", vim.log.levels.WARN)
    end
end, opts) -- Add file from nvim-tree to Avante chat

-- File management for Avante
keymap.set('n', '<Space>aF', function()
    -- Add current file to Avante chat
    local filepath = vim.fn.expand('%:.')
    if filepath ~= '' then
        local sidebar = require('avante').get()
        if not sidebar:is_open() then
            require('avante.api').ask()
            sidebar = require('avante').get()
        end
        if sidebar.file_selector then
            sidebar.file_selector:add_selected_file(filepath)
            vim.notify("Added " .. filepath .. " to Avante chat")
        end
    else
        vim.notify("No file to add", vim.log.levels.WARN)
    end
end, opts) -- Add current file to chat

-- Alternative nvim-tree integration using global functions
-- This will work after nvim-tree is loaded
keymap.set('n', '<Space>a+', function()
    local filetype = vim.bo.filetype
    if filetype == 'NvimTree' then
        -- Try to get the node under cursor
        local ok, api = pcall(require, "nvim-tree.api")
        if ok then
            local node = api.tree.get_node_under_cursor()
            if node and node.type == "file" then
                local ok_avante, avante_utils = pcall(require, 'avante.utils')
                if ok_avante then
                    local relative_path = avante_utils.relative_path(node.absolute_path)
                    local sidebar = require('avante').get()
                    if not sidebar:is_open() then
                        require('avante.api').ask()
                        sidebar = require('avante').get()
                    end
                    if sidebar.file_selector then
                        sidebar.file_selector:add_selected_file(relative_path)
                        vim.notify("Added " .. relative_path .. " to Avante chat")
                    end
                else
                    vim.notify("Avante not available", vim.log.levels.ERROR)
                end
            else
                vim.notify("Please select a file in nvim-tree", vim.log.levels.WARN)
            end
        else
            vim.notify("nvim-tree API not available", vim.log.levels.ERROR)
        end
    else
        vim.notify("Use this command when in nvim-tree", vim.log.levels.WARN)
    end
end, opts) -- Add file from nvim-tree to Avante (fallback)

keymap.set('n', '<Space>aP', function()
    -- Use Telescope to pick files for Avante
    require('telescope.builtin').find_files({
        prompt_title = "Add Files to Avante Chat",
        attach_mappings = function(prompt_bufnr, map)
            map('i', '<CR>', function()
                local selection = require('telescope.actions.state').get_selected_entry()
                require('telescope.actions').close(prompt_bufnr)

                if selection then
                    local filepath = selection.path or selection.value
                    local relative_path = vim.fn.fnamemodify(filepath, ':.')

                    local sidebar = require('avante').get()
                    if not sidebar:is_open() then
                        require('avante.api').ask()
                        sidebar = require('avante').get()
                    end
                    if sidebar.file_selector then
                        sidebar.file_selector:add_selected_file(relative_path)
                        vim.notify("Added " .. relative_path .. " to Avante chat")
                    end
                end
            end)
            return true
        end,
    })
end, opts) -- Pick files with Telescope to add to chat


--
-- Auto command to ensure proper setup
--
vim.api.nvim_create_autocmd("FileType", {
    pattern = "Avante",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
    end,
})

-- Set environment variable reminder
if not os.getenv("ANTHROPIC_API_KEY") and not os.getenv("OPENAI_API_KEY") then
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            vim.notify(
                "Avante: Please set ANTHROPIC_API_KEY or OPENAI_API_KEY environment variable for AI functionality",
                vim.log.levels.WARN
            )
        end,
    })
end
