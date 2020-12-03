
def validA(low, high, letter, password)
  count = password.count(letter)
  
  count >= low && count <= high
end

def validB(first, second, letter, password)
  firstChar = password[first - 1]
  secondChar = password[second - 1]

  (firstChar == letter) ^ (secondChar == letter)
end

def main
  count = 0

  File.readlines("two.txt").each do |line|
    
    row = line.split(" ")

    low_high = row.first.split('-')
    low = low_high[0].to_i
    high = low_high[1].to_i

    letter = row[1][0]
    
    pass = row[2]

    count += 1 if validB(low, high, letter, pass)

  end

  puts count
end

main