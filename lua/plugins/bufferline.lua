return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('bufferline').setup {
      options = {
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        mode = 'buffers',
        style_preset = require('bufferline').style_preset.default,
        themable = true,
        numbers = 'none',
        close_command = 'bdelete! %d',
        right_mouse_command = 'bdelete! %d',
        left_mouse_command = 'buffer %d',
        indicator = {
          icon = '▎',
          style = 'icon',
        },
        buffer_close_icon = '󰅖',
        modified_icon = '󰈸',
        close_icon = ' ',
        left_trunc_marker = ' ',
        right_trunc_marker = ' ',
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = 'nvim_lsp',
        diagnostics_update_in_insert = false,
        diagnostics_update_on_event = true,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          return '( ' .. count .. ')'
        end,
        color_icons = true,
        get_element_icon = function(element)
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
        end,
        duplicates_across_groups = true,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = 'slope',
        enforce_regular_tabs = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { 'close' },
        },
        sort_by = 'insert_at_end',
      },
    }
  end,
}