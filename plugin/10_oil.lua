vim.api.nvim_create_user_command('PackUpdate', function()
  vim.notify('Updating all packages...', vim.log.levels.INFO)
  
  local updated_count = 0
  local failed_count = 0
  local output_lines = {}
  
  for name, plugin in pairs(vim.pack.installed) do
    if plugin.spec and plugin.spec.src then
      vim.notify('Updating ' .. name .. '...', vim.log.levels.INFO)
      
      local success, err = pcall(function()
        vim.pack.update(name)
        updated_count = updated_count + 1
        table.insert(output_lines, '✓ Updated: ' .. name)
      end)
      
      if not success then
        failed_count = failed_count + 1
        table.insert(output_lines, '✗ Failed: ' .. name .. ' - ' .. tostring(err))
      end
    end
  end
  
  local summary = string.format('\nPackage Update Summary:\n✓ Updated: %d\n✗ Failed: %d', updated_count, failed_count)
  table.insert(output_lines, summary)
  
  vim.notify(table.concat(output_lines, '\n'), vim.log.levels.INFO, { title = 'PackUpdate Complete' })
end, {
  desc = 'Update all installed packages'
})