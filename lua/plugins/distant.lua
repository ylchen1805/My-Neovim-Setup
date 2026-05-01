return {
    "chipsenkbeil/distant.nvim",
    branch = "v0.3",
    config = function()
        require("distant"):setup({
            servers = {
                ["140.114.164.17"] = {
                    ssh = {
                        binary = "/Users/allen/.local/share/nvim/distant.nvim/bin/distant",
                        backend = "ssh",
                    },
                    lsp = {
                        python = {
                            -- 建議：在遠端全域安裝 pyright，或指定絕對路徑
                            cmd = "/home/allen/.local/bin/basedpyright-langserver",
                            args = { "--stdio" },
                            -- 這裡可以加入額外初始化，但 pyright 通常會自動尋找目錄下的 pyrightconfig.json
                        },
                    },
                },
            },
        })
    end,
}
