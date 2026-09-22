local M = {}

function M.is_in(array, item)
  for _, v in ipairs(array) do
    if v == item then
      return true
    end
  end
  return false
end

return M
