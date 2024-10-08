require('bufferline').setup {
  options = {
    indicador = {
      icon = '▎',
    },
    middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
    right_mouse_command = "vertical sbuffer %d",
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    -- diagnostics = "nvim_lsp",
    offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "left", padding = 1 } },
    -- show_buffer_icons = true | false, -- disable filetype icons for buffers
    show_buffer_close_icons = true
    -- show_close_icon = true | false,
    -- show_tab_indicators = true | false,
    -- persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    -- separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
    -- enforce_regular_tabs = false | true,
    -- always_show_bufferline = true | false,
    -- sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
    -- add custom logic
    -- return buffer_a.modified > buffer_b.modified
    -- end
  } 
}
