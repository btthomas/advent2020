values = []

text = File.readlines("one.txt").each do |line|
  value = line.to_i

  values.each do |old_value|
    if (old_value + value == 2020)
      puts (old_value * value)
    end
  end

  values << value
end

# puts values.join(', ')