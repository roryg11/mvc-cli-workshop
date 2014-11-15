require_relative "./lib/command_line_app"
require_relative "./lib/todo_app"
require_relative "./lib/view"
require_relative "./lib/model"
require_relative "./lib/controller"
require_relative "./lib/task_controller"

TodoApp.new($stdin, $stdout).run
