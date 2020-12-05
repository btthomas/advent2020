KEYS = %w(byr iyr eyr hgt hcl ecl pid)

COLORS = %w(amb blu brn gry grn hzl oth)

def span(val, low, high)
  return val.to_i >= low && val.to_i <= high
end

def byr(val)
  span(val, 1920, 2002)
end

def iyr(val)
  span(val, 2010, 2020)
end

def eyr(val)
  span(val, 2020, 2030)
end

def hgt(val)
  # hgt (Height) - a number followed by either cm or in:
  return false unless val.include?('cm') || val.include?('in')
  if val.end_with?('cm')
    # If cm, the number must be at least 150 and at most 193.
    int = val.split('cm')[0].to_i
    int >= 150 && int <= 193
  else
    # If in, the number must be at least 59 and at most 76.
    int = val.split('in')[0].to_i
    int >= 59 && int <= 76
  end
end

def hcl(val)
  # hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
  !!(/#[a-f0-9]{6}/.match(val))
end

def ecl(val)
  # ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
  COLORS.include?(val)
end

def pid (val)
  # pid (Passport ID) - a nine-digit number, including leading zeroes.
  return false unless val.length == 9
  !!(/[0-9]{9}/.match(val))
end

def check(license)
  KEYS.all? do |key|
    val = license[key]
    return false unless val
    
    case key
    when 'byr'
      # byr (Birth Year) - four digits; at least 1920 and at most 2002.
      return false unless (/[0-9]{4}/.match(val))
      byr(val)
    when 'iyr'
      # iyr (Issue Year) - four digits; at least 2010 and at most 2020.
      return false unless (/[0-9]{4}/.match(val))
      iyr(val)
    when 'eyr'
      # eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
      return false unless (/[0-9]{4}/.match(val))
      eyr(val)
    when 'hgt'
      hgt(val)
    when 'hcl'
      hcl(val)
    when 'ecl'
      ecl(val)
    when 'pid'
      pid(val)
    when 'cid'
      # cid (Country ID) - ignored, missing or not.
      true
    else
      raise "bad key"
    end
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