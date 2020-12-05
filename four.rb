KEYS = %w(byr iyr eyr hgt hcl ecl pid)
# cid

def check(license)
  KEYS.all? do |key|
    license.has_key? key
  end
end

def main
  count = 0
  current = {}

  File.readlines("four.txt").each do |line|
    string = line.chomp

    if (string == '')
      count += 1 if check(current)
      current = {}
    else
      string.split(' ').each do |kv|
        key, value = kv.split(':')
        current[key] = value
      end
    end
  end
  
  count += 1 if check(current)
  puts count
end

main