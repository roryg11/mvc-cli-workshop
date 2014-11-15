class TodoApp < CommandLineApp
  attr_reader :view, :model, :controller

  def initialize(input, output)
    @input = input
    @view = View.new(input, output)
    @model = Model.new
    @controller = Controller.new(model, view, input)
  end

  # Controller section
  def list_projects_action
    controller.list_projects_action
  end

  def create_projects_project_action
    controller.create_projects_project_action
  end

  def delete_project_project_action
    controller.delete_project_project_action
  end

  def rename_project_project_action
    controller.rename_project_project_action
  end

  def edit_project_project_action
    controller.edit_project_project_action
  end

  # router
  def run
    run_project_menu
    model.write_file
  end

  def run_project_menu
    view.print_project_menu

    welcome_menu_running = true

    while welcome_menu_running
      input = view.get_input

      if input == 'list'
        list_projects_action
      elsif input == 'create'
        create_projects_project_action
        model.write_file
      elsif input == 'delete'
        delete_project_project_action
        model.write_file
      elsif input == 'rename'
        rename_project_project_action
        model.write_file
      elsif input == 'edit'
        edit_project_project_action
      elsif input == 'quit'
        welcome_menu_running = false
      end
    end
  end

  # def list_tasks_task_action
  #   controller.list_tasks_task_action
  # end
  #
  # def create_tasks_task_action
  #   controller.create_tasks_task_action
  # end
  #
  # def edit_tasks_task_action
  #   controller.edit_tasks_task_action
  # end
  #
  # def complete_tasks_task_action
  #   controller.complete_task_task_action
  # end
  #
  # def run_task_menu(project_name)
  #   view.print_task_menu(project_name)
  #
  #   task_menu = true
  #
  #   while task_menu
  #     task_input = view.get_input
  #     if task_input == 'list'
  #       list_tasks_task_action
  #     elsif task_input == 'create'
  #       create_tasks_task_action
  #     elsif task_input == 'edit'
  #       edit_tasks_task_action
  #     elsif task_input == 'complete'
  #       complete_task_task_action
  #     elsif task_input == 'back'
  #       view.print_project_menu
  #       task_menu = false
  #     end
  #   end
  # end

  def real_puts message = ""
    $stdout.puts message
  end
end
