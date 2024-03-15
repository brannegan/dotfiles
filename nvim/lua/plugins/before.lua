return { 'bloznelis/before.nvim',
    config = function()
        local before = require('before')
        before.setup({
            history_size = 42,
            history_wrap_enabled = true,
            telescope_for_preview = false,
        })
        vim.keymap.set('n', '<C-k>', before.jump_to_last_edit, {})
        vim.keymap.set('n', '<C-j>', before.jump_to_next_edit, {})
        vim.keymap.set('n', '<leader>ed', function()
            before.show_edits(require('telescope.themes').get_dropdown())
        end, {})
        --vim.keymap.set('n', '<leader>oe', before.show_edits, {})
    end
}
