require 'date'

class List
  def initialize(name)
    @tasks = []
    @name = name
  end

  def <<(task)
    @tasks << task
  end

  def delete_task(task)
    @tasks.delete(task)
  end

  def all_complete?
    @tasks.each do |task|
      return false unless task.complete?
    end
    return true
  end

  def first
    return @tasks[0]
  end

  def last
    return @tasks[-1]
  end

  def display_tasks
    if all_complete?
      puts "You have no incomplete tasks - YAY!"
    else
      puts "Tasks:"
      @tasks.each do |task|
        if !task.complete?
          puts
          task.display
        end
      end
    end
  end

  def overdue_tasks
    puts "OVERDUE TASKS:"
    @tasks.each do |task|
      task.display if task.overdue?
    end
  end
end

class Task
  attr_accessor :name, :priority, :deadline

  def initialize(name)
    @name = name
    @complete = false
  end

  def complete!
    @complete = true
  end

  def complete?
    return @complete
  end

  def formatted_deadline
    @deadline.strftime("%b %d, %Y")
  end

  def display
    puts "Name: #{@name}"
    if complete?
      puts "Task completed!"
    else
      puts "Task not yet complete."
    end
    puts "Priority: #{@priority}"
    puts "Deadline: #{@formatted_deadline}"
  end

  def overdue?
    return @deadline && @deadline < Date.today
  end

end


list = List.new("Things to do today")

task = Task.new("Go for a sleep study")

task.name = "Sleep while studying"

task.priority = "High"

task.deadline = Date.new(2015, 1, 1)

list << task

list.display_tasks

list.delete_task(task)

list << Task.new("Wake up")
list << Task.new("Brush teeth")

list.display_tasks

list.first.complete!
list.last.complete!

puts

list.display_tasks

list << Task.new("Eat garlic")

list.last.deadline = Date.new(1999, 1, 1)

list.overdue_tasks


