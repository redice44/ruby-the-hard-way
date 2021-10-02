filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that hit ctrl c"
puts "If you do want that hit enter"

$stdin.gets

puts "opening the file.."
target = open(filename, 'w')

puts "truncating the file. goodbye!"
target.truncate(0)

puts "now I'm going to ask you for three lines"

print "Line 1: "
line1 = $stdin.gets.chomp
print "Line 2: "
line2 = $stdin.gets.chomp
print "Line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file"

format = "%{line1}\n%{line2}\n%{line3}\n"

target.write(format % {line1: line1, line2: line2, line3: line3})

puts "And finally, we close it"
target.close
