local lspconfig = require('lspconfig')
local completion = require('completion')

local on_attach = function(a, b)
    completion.on_attach(a, b)
end

local servers = {'tsserver', 'clangd', 'pyls', 'gopls'}

for _, server in ipairs(servers) do
    lspconfig[server].setup{on_attach=function(c, b)
            print("'" .. server .. "' started") -- so I'm "sure" my LS has started!
            on_attach(a, b)
        end}
end
