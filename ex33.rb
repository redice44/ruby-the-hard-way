def count_by(max, inc)
  i = 0
  numbers = []

  while i < max
    #puts "At the top i is #{i}"
    numbers.push(i)

    i += inc
    #puts "Numbers now: ", numbers
    #puts "At the bottom i is #{i}"
  end

  puts "The numbers (while): "
  numbers.each {|num| puts num }
end

def count_for(max, inc) 
  numbers = []
  (0 ... max).step(inc).each {|i|
    #puts "At the top i is #{i}"
    numbers.push(i)

    #puts "Numbers now: ", numbers
    #puts "At the bottom i is #{i}"

  }
  puts "The numbers (for): "
  numbers.each {|num| puts num }
end

count_by(6, 2)
count_by(2, 1)
count_for(6, 2)
count_for(2, 1)
