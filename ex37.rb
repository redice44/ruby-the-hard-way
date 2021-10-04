# little scary
END { puts 'end' }
BEGIN { puts 'begin' }

def add(a, b)
  return a + b
end

alias add_num add

puts add_num(1, 1)
puts defined? add
puts defined? add == nil

(0..5).each { |i|
  puts i
  # seems scary
  # redo if i > 2
}

puts 4 <=> 3
puts 4 <=> 4
puts 4 <=> 5

