local status_ok, autotag_config = pcall(require, "nvim-ts-autotag")
if not status_ok then
  return
end

autotag_config.setup {}
