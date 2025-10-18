local bufferline = require 'bufferline'
bufferline.setup {
  options = {
    always_show_bufferline = false,
    auto_toggle_bufferline = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = true,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    mode = 'buffers',
    style_preset = bufferline.style_preset.default,
    themable = true,
    numbers = 'none', --- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
    close_command = 'bdelete! %d', -- can be a string | function, | false see "Mouse actions"
    right_mouse_command = 'bdelete! %d', -- can be a string | function | false, see "Mouse actions"
    left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon', --| 'underline' | 'none',
    },
    buffer_close_icon = '󰅖',
    modified_icon = '󰈸',
    close_icon = ' ',
    left_trunc_marker = ' ',
    right_trunc_marker = ' ',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = false,
    diagnostics_update_on_event = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return '( ' .. count .. ')'
    end,
    color_icons = true,
    get_element_icon = function(element)
      local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
      return icon, hl
    end,
    duplicates_across_groups = true, -- whether to consider duplicate paths in different groups as duplicates
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = 'slope', -- | 'slope' | 'thick' | 'thin' | { 'any', 'any' },
    enforce_regular_tabs = false,
    hover = {
      enabled = true,
      delay = 200,
      reveal = { 'close' },
    },
    sort_by = 'insert_at_end',
  },
}
