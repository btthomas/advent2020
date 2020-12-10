def parse(string)
  type, number = string.split(' ')
  
  {
    type: type,
    number: number.to_i,
    called: false,
  }
end

def flip(instruction)
  type = case instruction[:type]
    when 'acc'
      'acc'
    when 'nop'
      'jmp'
    when 'jmp'
      'nop'
    end

  {
    type: type,
    number: instruction[:number],
    called: instruction[:called],
  }
end

def iterate(instructions, index)
  current_index = 0
  accumulator = 0

  while true
    if current_index >= instructions.length
      solved = accumulator
      puts solved
      break
    end

    instruction = instructions[current_index]
    if (instruction[:called] == index)
      break
    end

    instruction[:called] = index

    case instruction[:type]
    when 'nop'
      current_index += 1
    when 'acc'
      accumulator += instruction[:number]
      current_index += 1
    when 'jmp'
      current_index += instruction[:number]
    else
      raise Error.new("Missing Type")
    end
  end
end

def solve(instructions)
  solved = false

  instructions.each_with_index do |inst, index|
    copy = instructions.clone
    copy[index] = flip(inst)

    iterate(copy, index)
  end
end

def main
  instructions = []

  File.readlines("eight.txt").each do |line|
    string = line.chomp
    
    instructions << parse(string)
  end

  solve(instructions)
end

main