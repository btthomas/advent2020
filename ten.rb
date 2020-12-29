def calculate(numbers)
  last = 0
  ones = []
  twos = []
  threes = []

  for num in numbers
    if (num - last) == 1
      ones << num
    elsif (num - last) == 2
      twos << num
    elsif (num - last) == 3
      threes << num
    end

    last = num
  end

  puts "ones: #{ones.length}"
  puts "twos: #{twos.length}"
  puts "threes: #{threes.length + 1}"
end

def calculate2(numbers)
  total = { "0" => 1}

  for num in numbers
    sum = 0
    three = (num - 3).to_s
    two = (num - 2).to_s
    one = (num - 1).to_s

    if total.keys.include?(three)
      sum += total[three]
    end

    if total.keys.include?(two)
      sum += total[two]
    end

    if total.keys.include?(one)
      sum += total[one]
    end

    total[num.to_s] = sum
  end

  puts total
end

def main
  numbers = []

  File.readlines("ten.txt").each do |line|
    string = line.chomp
    
    numbers << string.to_i
  end

  calculate2(numbers.sort)
end

main
