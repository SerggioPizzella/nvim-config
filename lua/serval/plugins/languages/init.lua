local plugins = {}

-- Get the directory of the current file
local current_file = debug.getinfo(1, 'S').source:sub(2)
local dir = vim.fs.dirname(current_file)

for _, file in ipairs(vim.fn.readdir(dir)) do
  if file:sub(-4) == '.lua' and file ~= 'init.lua' then
    local ok, plugin = pcall(require, 'serval.plugins.languages.' .. file:sub(1, -5))
    if ok and type(plugin) == 'table' then
      table.insert(plugins, plugin)
    end
  end
end

return plugins
