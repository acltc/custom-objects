class List
  def initialize(name)
    @tasks = []
    @name = name
  end

  def add_task(task)
    @tasks << task
  end

  def display_tasks
    @tasks.each do |task|
      puts task.name
    end
  end
end

class Task
  def initialize(name)
    @name = name
  end

  def name
    return @name
  end
end


list = List.new("Things to do today")

task = Task.new("Go for a sleep study")

list.add_task(task)

list.display_tasks



