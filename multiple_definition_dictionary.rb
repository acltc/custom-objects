dictionary = {"blue" => ["a color", "sad"], "green" => ["a color"]}

while true
  user_input = gets.chomp

  command = user_input.split(":").first.strip
  arguments = user_input.split(":").last.strip

  if command == "lookup"
    puts dictionary[arguments]
  elsif command == "all"
    dictionary.each do |word, definition|
      puts "The definition of #{word} is #{definition}."
    end
  elsif command == "define"
    word = arguments.split(",").first
    definition = arguments.split(",").last
    if dictionary[word].nil?
      dictionary[word] = []
    end
    dictionary[word] << definition
  end
   
end



# define: word, definition
# lookup: word
# all