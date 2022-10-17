local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
    --[[ on_init = function(new_client, _) ]]
    --[[   new_client.offset_encoding = 'utf-32' ]]
    --[[ end, ]]
    debug = false,
    sources = {
        formatting.prettier.with({
            extra_args = { "--tab-width 4", "-w" },
        }),

        formatting.clang_format.with({
            extra_args = { '-style="{BasedOnStyle: Mozilla, IndentWidth: 4}"' },
        }),

        formatting.black, -- for python code formatting.

        formatting.stylua, -- for lua code formatting.
    },
})
