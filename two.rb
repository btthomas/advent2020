
def valid(low, high, letter, password)
  count = password.count(letter)
  
  count >= low && count <= high
end

def main
  count = 0

  text = File.readlines("two.txt").each do |line|
    
    row = line.split(" ")

    low_high = row.first.split('-')
    low = low_high[0].to_i
    high = low_high[1].to_i

    letter = row[1][0]
    
    pass = row[2]

    count += 1 if valid(low, high, letter, pass)

  end

  puts count
end

main