def add(a, b)
  puts "#{a} + #{b}"
  return a + b
end

def sub(a, b)
  puts "#{a} - #{b}"
  return a - b
end

def mul(a, b)
  puts "#{a} * #{b}"
  return a * b
end

def div(a, b)
  puts "#{a} / #{b}"
  return a / b
end

age = add(30, 5)
height = sub(78, 4)
weight = mul(90, 2)
iq = div(200, 2)

puts "Age: #{age}, height: #{height}, weight: #{weight}, IQ: #{iq}"

what = add(age, sub(height, mul(weight, div(iq, 2))))

puts what


