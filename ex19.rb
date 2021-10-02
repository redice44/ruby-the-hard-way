def cheese_and_crackers(cheese_count, boxes_of_crackers)
  puts "You have #{cheese_count} cheeses!"
  puts "You have #{boxes_of_crackers} boxes of crackers"
  puts "That's enough"
end

puts "We can call directly"
cheese_and_crackers(10, 50)

puts "or use vars"

amount_of_cheese = 20
amount_of_cracker_boxes = 100

cheese_and_crackers(amount_of_cheese, amount_of_cracker_boxes)
