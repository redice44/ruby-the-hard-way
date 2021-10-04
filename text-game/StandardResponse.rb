module StandardResponse
  def StandardResponse.prompt
    print '> '
  end

  def StandardResponse.invalid_entry(entry)
    puts "Invalid input #{entry}"
  end

  def StandardResponse.get_input(prompt, valid_input)
    while true
      puts prompt
      StandardResponse.prompt
      input = $stdin.gets.chomp.upcase
      puts "\n"
      if !valid_input.include?(input)
        StandardResponse.invalid_entry(input)
      else
        return input 
      end
    end
  end

  def StandardResponse.bad_end
    puts "\n\nYou lose."
  end
  
  def StandardResponse.good_end
    puts "\n\nYou win!"
  end
end
