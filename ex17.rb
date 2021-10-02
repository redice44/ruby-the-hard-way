from_file, to_file = ARGV

puts "Copy from #{from_file} to #{to_file}"

in_file = open(from_file)
in_data = in_file.read

puts "The input file is #{in_data.length} bytes long"

puts "Does the output file exist? #{File.exists?(to_file)}"
puts "Ready, hit enter to continue or ctrl c to quit"

$stdin.gets

out_file = open(to_file, 'w')
out_file.write(in_data)
out_file.close
in_file.close

puts "all done"
