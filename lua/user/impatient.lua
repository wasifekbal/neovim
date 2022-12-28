local status_ok, impatient_config = pcall(require, "impatient")
if not status_ok then
    print("problem in impatient config")
    return
end

impatient_config.enable_profile()
