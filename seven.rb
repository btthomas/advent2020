DONE = []
SUM = {}

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

  calc(rules, "shiny gold")

  puts DONE.uniq.length
end

def parse_rule_b(string)
  out_to_in = {}

  outer_string, inner_string = string.split('contain')
  outer_type = outer_string[0..-7]

  return Hash[outer_type, []] if inner_string == " no other bags."

  array = []
  inners = inner_string.split(',')
  inners.each do |inner|
    num, mod, color, rest = inner.strip.split(' ')

    array << { num: num.to_i, type: [mod, color].join(' ')}
  end

  out_to_in[outer_type] = array

  out_to_in
end

def calcb(rules, type)
  return SUM[type] if SUM[type]

  contents = rules[type]
  
  return 0 if contents.length == 0
  sum = 0

  contents.each do |rule|
    add = rule[:num] + rule[:num] * calcb(rules, rule[:type])
    sum += add
  end

  SUM[type] = sum
  sum
end

def mainb
  rules = {}
  File.readlines("seven.txt").each do |line|
    string = line.chomp

    rule = parse_rule_b(string)

    rules = rules.merge(rule)
  end

  total = calcb(rules, "shiny gold")

  puts total
end

mainb