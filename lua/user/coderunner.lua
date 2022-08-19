local status_ok, coderunner_config = pcall(require, "code_runner")
if not status_ok then
  return
end


coderunner_config.setup({
  -- put here the commands by filetype
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt"
  },
  term = {
    --  Position to open the terminal, this option is ignored if mode is tab
    position = "bot",
    -- window size, this option is ignored if tab is true
    size = 12,
  }
})
