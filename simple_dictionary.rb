dictionary = {"blue" => "a color", "green" => "a color"}
puts "Welcome to the dictionary! Use the all command to view the entire dictionary. Use the define command to add a new word to the dictionary. Use the lookup command to look up a particualar word."
while true
  user_input = gets.chomp

  command = user_input.split(":").first.strip
  arguments = user_input.split(":").last.strip

  if command == "lookup"
    puts dictionary[arguments]
  elsif command == "all"
    dictionary.each do |word, definition|
      puts "#{word}: #{definition}"
    end
  elsif command == "define"
    word = arguments.split(",").first
    definition = arguments.split(",").last
    dictionary[word] = definition
  end
   
end



# define: word, definition
# lookup: word
# all