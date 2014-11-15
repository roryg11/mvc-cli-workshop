class Controller
  attr_reader :model, :view, :input, :task_controller

  def initialize(model, view, input)
    @model = model
    @view = view
    @input = input
    @task_controller = TaskController.new(model, view, input)
  end

  def list_projects_action
    projects = model.projects
    view.print_projects_list(projects)
  end

  def create_projects_project_action
    view.print_project_create_prompt
    model.project_add(view.get_input)
    view.print_project_menu
  end

  def delete_project_project_action
    view.print_project_delete_prompt
    model.project_delete(view.get_input)
  end

  def rename_project_project_action
    view.print_project_rename_prompt
    if model.project_present?(old_name = view.get_input)
      view.print_prompt_for_new_project_name
      model.project_rename(old_name, view.get_input)
    end
  end

  def edit_project_project_action
    view.print_project_edit_prompt
    project_name = view.get_input
    if model.project_present?(project_name)
      run_task_menu(project_name)
      view.print_task_menu(project_name)
    end
  end

  def list_tasks_task_action
    task_controller.list_tasks_task_action
  end

  def create_tasks_task_action
    task_controller.create_tasks_task_action
  end

  def edit_tasks_task_action
    task_controller.edit_tasks_task_action
  end

  def complete_tasks_task_action
    task_controller.complete_tasks_task_action
  end

  def run_task_menu(project_name)
    view.print_task_menu(project_name)

    task_menu = true

    while task_menu
      task_input = view.get_input
      if task_input == 'list'
        list_tasks_task_action
      elsif task_input == 'create'
        create_tasks_task_action
      elsif task_input == 'edit'
        edit_tasks_task_action
      elsif task_input == 'complete'
        complete_tasks_task_action
      elsif task_input == 'back'
        view.print_project_menu
        task_menu = false
      end
    end
  end

end
