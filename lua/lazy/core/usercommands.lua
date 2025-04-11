vim.api.nvim_create_user_command("PlugReload",
  function(opts)
    local plugin_name = opts.args
    if plugin_name == nil then
      vim.notify("No plugin specified!", vim.log.levels.ERROR)
    end
    if package.loaded[plugin_name] ~= nil then
      package.loaded[plugin_name] = nil
      require(plugin_name).setup()
    end
  end,
  { nargs = 1, desc = "Plugin to reload" }
)

