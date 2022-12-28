local options = {}
options.settings = {
    python = {
        analysis = {
            typeCheckingMode = "off",
            reportOptionalSubscript = "off",
            reportOptionalMemberAccess = "off",
        },
    },
}
return options
