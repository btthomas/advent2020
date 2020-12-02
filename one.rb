values = []

text = File.readlines("one.txt").each do |line|
  value = line.to_i
  values << value
end

values = values.sort

values.each_with_index do |first, i1|
  
  values.each_with_index do |second, i2|
    next if (i2 <= i1)
    
    values.each_with_index do |third, i3|
      next if (i3 <= i2)

      if (first + second + third == 2020)
        puts (first * second * third)
      end
    end
  end
end

# puts values.join(', ')