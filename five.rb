def row_value(row)
  row.to_i(base=2)
end

def seat_value(seat)
  seat.to_i(base=2)
end

def main
  taken = []

  File.readlines("five.txt").each do |line|
    string = line.chomp

    num = string.gsub(/[FL]/, '0').gsub(/[BR]/, '1').gsub(/R/, '1').to_i(2)

    taken << num
  end

  taken = taken.sort

  last = taken[0] - 1

  taken.each do |seat|
    if seat == last + 1
      last = seat
    else
      puts seat - 1
      last = seat
    end
  end

  # puts taken.join(', ')
end

main