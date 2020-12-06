def check(group)
  # puts "#{group.length}: #{group}"
  group.length
end

def main
  count = 0
  current = {}

  File.readlines("six.txt").each do |line|
    string = line.chomp

    if (string == '')
      count += check(current)
      current = {}
    else
      string.split('').each do |char|
        current[char] = true
      end
    end
  end
  
  count += check(current)
  puts count
end

main