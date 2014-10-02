class Dictionary

  def initialize
    @entries = {}
  end

  def lookup(word)
    return @entries[word]
  end

  def define(word, definition)
    @entries[word] = definition
    return "#{word} added!"
  end

  def entries
    return @entries
  end
end

class Command
  def initialize(user_input, dictionary)
    @dictionary = dictionary
    @command = user_input.split(":").first.strip
    @arguments = user_input.split(":").last.strip
    send(@command, @arguments)
  end

  def lookup(arguments)
    puts "DEFINITION: #{@dictionary.lookup(arguments)}"
  end

  def define(arguments)
    word = arguments.split(",").first.strip
    definition = arguments.split(",").last.strip
    puts @dictionary.define(word, definition)
  end

  def all(arguments)
    @dictionary.entries.each do |word, definition|
      puts "#{word}: #{definition}"
    end
  end

end

# running the actual program:

dictionary = Dictionary.new

while true
  puts "Please enter a command:"
  user_input = gets.chomp

  Command.new(user_input, dictionary)
end