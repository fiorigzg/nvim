-- Jupyter notebooks:
--   jupytext.nvim (goerz fork) opens .ipynb as a python file with `# %%` cells and writes it back on save
--   molten-nvim runs code in a jupyter kernel and shows output under the cell
-- Requires the python venv at stdpath("data")/python-venv (pynvim, jupyter_client, ipykernel, pillow)
-- and `jupytext` on PATH.

local CELL_MARKER = "^# %%"

-- Range of the `# %%` cell under cursor (without the marker line)
local function cell_range()
    local first = vim.fn.search(CELL_MARKER, "bcnW")
    local next = vim.fn.search(CELL_MARKER, "nW")
    first = first == 0 and 1 or first + 1
    next = next == 0 and vim.fn.line("$") or next - 1
    return first, next
end

local function run_cell()
    local first, last = cell_range()
    if first <= last then
        vim.fn.MoltenEvaluateRange(first, last)
    end
end

local function run_all_cells()
    local markers = {}
    for lnum, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        if line:match(CELL_MARKER) then
            table.insert(markers, lnum)
        end
    end
    table.insert(markers, vim.fn.line("$") + 1)

    local first = 1
    for _, marker in ipairs(markers) do
        if first <= marker - 1 then
            vim.fn.MoltenEvaluateRange(first, marker - 1)
        end
        first = marker + 1
    end
end

-- Images saved in the .ipynb outputs (jupytext drops outputs from the buffer): pick one and open it
-- in the system viewer, since the terminal can't draw images
local function notebook_images()
    local file = vim.api.nvim_buf_get_name(0)
    if not file:match("%.ipynb$") then
        vim.notify("Not a notebook", vim.log.levels.WARN)
        return
    end

    local notebook = vim.json.decode(table.concat(vim.fn.readfile(file), "\n"))
    local dir = vim.fn.tempname()
    vim.fn.mkdir(dir, "p")
    local images = {}
    for cell_nr, cell in ipairs(notebook.cells) do
        for _, output in ipairs(cell.outputs or {}) do
            for mime, ext in pairs({ ["image/png"] = "png", ["image/jpeg"] = "jpg" }) do
                local data = output.data and output.data[mime]
                if data then
                    data = type(data) == "table" and table.concat(data) or data
                    local path = ("%s/cell%d_%d.%s"):format(dir, cell_nr, #images + 1, ext)
                    local f = assert(io.open(path, "wb"))
                    f:write(vim.base64.decode((data:gsub("%s", ""))))
                    f:close()
                    local source = type(cell.source) == "table" and table.concat(cell.source) or cell.source
                    table.insert(images, { path = path, label = ("cell %d: %s"):format(cell_nr, source:match("[^\n]*")) })
                end
            end
        end
    end

    if #images == 0 then
        vim.notify("No images in notebook outputs")
        return
    end
    vim.ui.select(images, {
        prompt = "Notebook images",
        format_item = function(item) return item.label end,
    }, function(item)
        if item then
            vim.ui.open(item.path)
        end
    end)
end

local function goto_cell(direction)
    vim.fn.search(CELL_MARKER, direction == "next" and "W" or "bW")
end

return {
    {
        "goerz/jupytext.nvim",
        lazy = false, -- must hook .ipynb reading before the first notebook is opened
        opts = {
            format = "py:percent", -- `--update` (on by default) keeps existing outputs in the .ipynb on save
            filetype = function(ipynb_file, format, metadata)
                local ft = require("jupytext").get_filetype(ipynb_file, format, metadata)
                return ft ~= "" and ft or "python" -- notebooks without kernelspec metadata
            end,
        },
    },

    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        build = ":UpdateRemotePlugins",
        lazy = false,
        init = function()
            -- Ptyxis can't draw images: plots are opened in the system image viewer instead (needs Pillow)
            vim.g.molten_image_provider = "none"
            vim.g.molten_auto_image_popup = true
            vim.g.molten_auto_open_output = false
            vim.g.molten_virt_text_output = true -- short output is shown right under the cell
            vim.g.molten_virt_lines_off_by_1 = true
            vim.g.molten_wrap_output = true
            vim.g.molten_output_win_max_height = 20
        end,
        keys = {
            { "<Space>ji", "<Cmd>MoltenInit<CR>", desc = "Start kernel" },
            { "<Space>jr", run_cell, desc = "Run cell" },
            {
                "<Space>jn",
                function()
                    run_cell()
                    goto_cell("next")
                end,
                desc = "Run cell and go to next",
            },
            { "<Space>ja", run_all_cells, desc = "Run all cells" },
            { "<Space>jl", "<Cmd>MoltenEvaluateLine<CR>", desc = "Run line" },
            { "<Space>jr", ":<C-u>MoltenEvaluateVisual<CR>gv<Esc>", mode = "x", desc = "Run selection" },
            { "<Space>jo", "<Cmd>noautocmd MoltenEnterOutput<CR>", desc = "Open output window" },
            { "<Space>jh", "<Cmd>MoltenHideOutput<CR>", desc = "Hide output" },
            { "<Space>jp", "<Cmd>MoltenImagePopup<CR>", desc = "Open cell image" },
            { "<Space>jP", notebook_images, desc = "Images saved in notebook" },
            { "<Space>jd", "<Cmd>MoltenDelete<CR>", desc = "Delete cell output" },
            { "<Space>jk", "<Cmd>MoltenInterrupt<CR>", desc = "Interrupt kernel" },
            { "<Space>jx", "<Cmd>MoltenRestart!<CR>", desc = "Restart kernel" },
            {
                "<Space>jc",
                function()
                    local _, last = cell_range()
                    vim.api.nvim_buf_set_lines(0, last, last, false, { "", "# %%", "" })
                    vim.api.nvim_win_set_cursor(0, { last + 3, 0 })
                end,
                desc = "New cell below",
            },
            { "]j", function() goto_cell("next") end, desc = "Next cell" },
            { "[j", function() goto_cell("prev") end, desc = "Prev cell" },
        },
    },
}
