class TaskController
  attr_reader :model, :view, :input

  def initialize(model, view, input)
    @model = model
    @view = view
    @input = input
  end

  def list_tasks_task_action
    view.print_tasks_list(model.tasks)
  end

  def create_tasks_task_action
    view.print_new_task_prompt
    model.add_task(view.get_input)
  end

  def edit_tasks_task_action
    view.print_task_edit_prompt
    old_name = view.get_input
    if model.task_present?(old_name)
      view.print_prompt_for_new_task_name
      model.task_rename(old_name, view.get_input)
    else
      view.print_task_not_here_message(old_name)
    end
  end

  def complete_tasks_task_action
    complete_task = view.get_input
    if model.task_present?(complete_task)
      model.complete_task(complete_task)
    else
      view.print_task_not_here_message(complete_task)
    end
  end

end
