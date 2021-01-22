local nvim_fzf = require("fzf")


return coroutine.wrap(function()
  local result = nvim_fzf.fzf({"choice 1", "choice 2"})  
  if result then
    print(result)
  end
end)()
