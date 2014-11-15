class Model
  attr_reader :projects, :tasks

  def initialize
    @projects = read_file
    @tasks = []
    # @file = File.open('projects.txt', 'w')
  end

  def read_file
    if File.exist?('projects.txt') #Is there a file?
      data_string = File.open('projects.txt', 'r').read #put all things in file in the data string
      data_string.split("\n") #Gives each project in an array
    else
      []
    end
  end

  def write_file #must iterate over the array
    # @file.write("#{projects}")
    data_string = @projects.join("\n")
    File.open('projects.txt', 'w') do |file_gutz|
      file_gutz.write(data_string)
    end #closes the file
  end

  def project_add(name)
    projects << name
  end

  def project_delete(name)
    if project_present?(name)
      projects.delete(name)
    end
  end

  def project_present?(name)
    projects.include?(name)
  end

  def project_rename(old_name, new_name)
    projects.delete(old_name)
    projects << new_name
  end

  def add_task(name)
    tasks << name
  end

  def task_present?(name)
    tasks.include?(name)
  end

  def task_rename(old_name, new_name)
    tasks.delete(old_name)
    tasks << new_name
  end

  def complete_task(name)
    tasks.delete(name)
    completed_task = "#{name}: completed"
    tasks << completed_task
  end
end
