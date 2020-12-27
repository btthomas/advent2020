LOOKBACK = 25
TARGET = 70_639_851

def calc_valids(chunk)
  v = []
  for i in 0..(chunk.length - 2)
    for j in (i + 1)..(chunk.length - 1)
      v << chunk[i] + chunk[j]
    end
  end

  v.uniq
end

def step_through(numbers)
  index = LOOKBACK

  while index < numbers.length
    target = numbers[index]
    chunk = numbers[(index - LOOKBACK)..(index - 1)]
    valids = calc_valids(chunk)

    if valids.include?(target)
      index += 1
    else
      puts target
      index += 1
    end
  end
end

def step_through2(numbers)
  puts TARGET

  for i in 0..(numbers.length - 1)
    sum = 0
    j = i

    while sum < TARGET
      sum += numbers[j]

      if sum == TARGET
        puts 'match'
        low = numbers[i..j].sort.first
        high = numbers[i..j].sort.last
        puts low + high
        puts 'match'
      end

      j += 1
    end
  end
end

def main
  numbers = []

  File.readlines("nine.txt").each do |line|
    string = line.chomp
    
    numbers << string.to_i
  end

  step_through2(numbers)
end

main
