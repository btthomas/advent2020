ALPHABET = (97..122).map{ |i| i.chr }

def check(num, group)
  counter = 0

  ALPHABET.each do |letter|
    counter += 1 if group.count(letter) == num
  end
  # puts "#{counter} / #{num} : #{group}"
  counter
end

def main
  count = 0
  num = 0
  current = ""

  File.readlines("six.txt").each do |line|
    string = line.chomp
    
    if (string == '')
      count += check(num, current)
      num = 0
      current = ""
    else
      num += 1
      current += string
    end
  end
  
  count += check(num, current)
  puts count
end

main