local layouts = {
  qwerty = {
    { mode = "n", key = "h", new_map = "h" },
    { mode = "n", key = "j", new_map = "j" },
    { mode = "n", key = "k", new_map = "k" },
    { mode = "n", key = "l", new_map = "l" },

    { mode = "v", key = "h", new_map = "h" },
    { mode = "v", key = "j", new_map = "j" },
    { mode = "v", key = "k", new_map = "k" },
    { mode = "v", key = "l", new_map = "l" },
  },
  colemak = {
    { mode = "n", key = "h", new_map = "h" },
    { mode = "n", key = "n", new_map = "j" },
    { mode = "n", key = "e", new_map = "k" },
    { mode = "n", key = "i", new_map = "l" },

    { mode = "v", key = "h", new_map = "h" },
    { mode = "v", key = "n", new_map = "j" },
    { mode = "v", key = "e", new_map = "k" },
    { mode = "v", key = "i", new_map = "l" },
  }
}

local function is_key_mapped(mode, key)
  local keymaps = vim.api.nvim_get_keymap(mode)
  for _, mapping in ipairs(keymaps) do
    if mapping.lhs == key then
      return true, mapping
    end
  end
  return false, nil
end

local function save_current_mappings(layout)
  local saved_mappings = {}
  for _, mapping in ipairs(layouts[layout]) do
    local is_mapped, existing_mapping = is_key_mapped(mapping.mode, mapping.key)
    if is_mapped then
      saved_mappings[#saved_mappings + 1] = {
        mode = mapping.mode,
        key = mapping.key,
        old_map = existing_mapping.rhs,
        options = {
          noremap = existing_mapping.noremap == 1,
          silent = existing_mapping.silent == 1,
          expr = existing_mapping.expr == 1,
          script = existing_mapping.script == 1,
          unique = existing_mapping.unique == 1
        }
      }
    end
  end
  return saved_mappings
end

local function set_layout(layout, saved_mappings)
  if not layouts[layout] then
    print("Error: Unknown layout '" .. layout .. "'")
    return nil
  end

  if saved_mappings then
    for _, mapping in ipairs(saved_mappings) do
      vim.api.nvim_set_keymap(
        mapping.mode,
        mapping.key,
        mapping.old_map,
        mapping.options
      )
    end
    print("Restored previous layout")
    return
  end

  local current_saved_mappings = save_current_mappings(layout)

  for _, mapping in ipairs(layouts[layout]) do
    vim.api.nvim_set_keymap(
      mapping.mode,
      mapping.key,
      mapping.new_map,
      {
        silent = true,
        noremap = true
      }
    )
  end

  print("Layout switched to: " .. layout)
  return current_saved_mappings
end

vim.api.nvim_create_user_command('Layout',
  function(opts)
    local layout = opts.args or "qwerty"
    set_layout(layout)
  end, {
    nargs = 1,
    complete = function(_, _, _)
      return vim.tbl_keys(layouts)
    end
})

