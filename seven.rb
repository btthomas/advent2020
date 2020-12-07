DONE = []

def parse_rule(string)
  in_to_out = {}

  outer_string, inner_string = string.split('contain')

  return in_to_out if inner_string == " no other bags."
  
  outer_type = outer_string[0..-7]

  inners = inner_string.split(',')

  inners.each do |inner|
    num, mod, color, rest = inner.strip.split(' ')

    inner_type = [mod, color].join(' ')

    in_to_out[inner_type] = [outer_type]
  end

  in_to_out
end

def calc(rules, type)
  return [] unless rules[type]
  return [] if DONE.include?(type)
  
  rules[type].each do |rule|
    next if DONE.include?(rule)

    calc(rules, rule)
    DONE << rule
  end
end

def main
  rules = {}
  File.readlines("seven.txt").each do |line|
    string = line.chomp

    rule = parse_rule(string)

    next if rule == {}

    rule.each do |key, value|
      if rules[key]
        rules[key] += value
      else
        rules[key] = value
      end
    end
    
  end

  # puts rules

  calc(rules, "shiny gold")

  # puts '--', DONE, '--'

  puts DONE.uniq.length

end

main