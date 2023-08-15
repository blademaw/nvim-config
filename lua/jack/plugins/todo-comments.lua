local setup, t_comment = pcall(require, "todo-comments")
if not setup then
  return
end

t_comment.setup()
