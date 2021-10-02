# number of cars
cars = 100

# car capacity
space_in_a_car = 5.0

# number of drivers
drivers = 10

# number of passengers
passengers = 90

# number of cars without drivers
cars_not_driven = cars - drivers

# number of cars with drivers
cars_driven = drivers

# number of people in carpool system
carpool_capacity = cars_driven * space_in_a_car

# averge number of passengers per car
average_passengers_per_car = passengers / cars_driven


puts "There are #{cars} cars available"
puts "There are only #{drivers} drivers available"
puts "There will be #{cars_not_driven} empty cars today"
puts "We can transport #{carpool_capacity} people today"
puts "We have #{passengers} to carpool today"
puts "We need to put about #{average_passengers_per_car} in each car"
