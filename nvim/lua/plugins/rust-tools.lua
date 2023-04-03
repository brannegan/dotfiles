
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return { "simrat39/rust-tools.nvim",
    ft = "rust",
    init = function() 
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        vim.api.nvim_create_autocmd("BufWritePre ", {
            pattern = "*.rs",
            callback = function()
                for _, client in ipairs(vim.lsp.get_active_clients()) do
                    if client.attached_buffers[vim.api.nvim_get_current_buf()] then
                        vim.lsp.buf.format()
                        return
                    else
                        return
                    end
                end
            end
        })
    end,
    dependencies = { 
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", 
           config = true,
           keys = {
               { "<leader>d", 
                 "<cmd>lua require('lsp_lines').toggle()<CR>", 
                 desc = "Toggle lsp_lines" }
           }
        },
        { "j-hui/fidget.nvim", config = true },
    },
    keys = {
        { "<F1>",       vim.lsp.buf.formatting,        desc ="LSP formatting" },
        { "<F2>",       vim.lsp.buf.rename,            desc ="LSP rename"},
        { "gd",         vim.lsp.buf.definition,        desc ="LSP definition" },
        { "gt",         vim.lsp.buf.type_definition,   desc ="LSP type definition" },
        { "<leader>a",  vim.lsp.buf.code_action,       desc ="LSP code action" },
        { "<leader>aa", vim.lsp.buf.range_code_action, desc ="LSP range code action" },
        { "<leader>h",  vim.lsp.buf.hover,             desc ="LSP hover" },
    },
    opts = {
        tools = { -- rust-tools options
        on_initialized = nil,
        reload_workspace_from_cargo_toml = true,
        hover_with_actions = false,
        inlay_hints = {
            auto = true,
            only_current_line = true,
            only_current_line_autocmd = "CursorHold",
            show_parameter_hints = false,
            parameter_hints_prefix = "•",
            other_hints_prefix = "»",
            highlight = "Comment",
        },
            hover_action = {
                auto_focus = false,
            },
        },
        server = {
            settings = {
                ["rust-analyzer"] = {
                    assist = {
                        importGranularity = "module",
                        importPrefix = "by_self",
                    },
                    cargo = {
                        allFeatures = true
                    },
                    procMacro = {
                        enable = true
                    },
                    checkOnSave = { 
                        command = "clippy" 
                    },
                    -- diagnostics = {
                    --   disabled = { "unresolved-proc-macro" }
                    -- }
                }
            },
            capabilities = capabilities,
        }
    }
}
