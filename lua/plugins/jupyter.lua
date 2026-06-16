return {
    {
        "GCBallesteros/jupytext.nvim",
        lazy = false,
        config = function()
            require("jupytext").setup({
                style = "hydrogen",
                output_extension = "auto",
                force_ft = nil,
                custom_language_formatting = {
                    python = {
                        extension = "py",
                        style = "percent",
                        force_ft = "python",
                    },
                },
            })
        end,
    },

    {
        "hkupty/iron.nvim",
        ft = { "python" },
        config = function()
            local iron = require("iron.core")
            local view = require("iron.view")
            local common = require("iron.fts.common")

            iron.setup({
                config = {
                    scratch_repl = true,
                    repl_definition = {
                        python = {
                            command = { "uv", "run", "ipython", "--no-autoindent" },
                            format = common.bracketed_paste,
                        },
                    },
                    repl_open_cmd = view.right(60),
                },
                keymaps = {
                    send_motion = "<leader>sc",
                    visual_send = "<leader>ss",
                    send_file = "<leader>sf",
                    send_line = "<leader>sl",
                    interrupt = "<leader>s<space>",
                    exit = "<leader>sq",
                    clear = "<leader>sx",
                },
                highlight = {
                    italic = true,
                },
                ignore_blank_lines = true,
            })

            vim.keymap.set("n", "<leader>rr", "<cmd>IronRepl<CR>", { desc = "Open REPL" })
            vim.keymap.set("n", "<leader>rf", "<cmd>IronFocus<CR>", { desc = "Focus REPL" })
            vim.keymap.set("n", "<leader>rh", "<cmd>IronHide<CR>", { desc = "Hide REPL" })

            local function send_current_cell()
                local buf = vim.api.nvim_get_current_buf()
                local row = vim.api.nvim_win_get_cursor(0)[1]
                local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

                local start_line = 1
                local end_line = #lines

                for i = row, 1, -1 do
                    if lines[i]:match("^# %%%%") then
                        start_line = i + 1
                        break
                    end
                end

                for i = row + 1, #lines do
                    if lines[i]:match("^# %%%%") then
                        end_line = i - 1
                        break
                    end
                end

                while start_line <= end_line and lines[start_line]:match("^%s*$") do
                    start_line = start_line + 1
                end

                while end_line >= start_line and lines[end_line]:match("^%s*$") do
                    end_line = end_line - 1
                end

                if start_line > end_line then
                    return
                end

                local cell = vim.api.nvim_buf_get_lines(buf, start_line - 1, end_line, false)
                iron.send(nil, cell)
            end

            vim.keymap.set("n", "<leader>jc", send_current_cell, { desc = "Send current cell" })
        end,
    },
}
