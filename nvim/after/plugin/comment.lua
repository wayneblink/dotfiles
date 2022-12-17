local ok, _ = pcall(require, "Comment")

if not ok then
    return
end

require("Comment").setup()
