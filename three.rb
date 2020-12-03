def main
  i = 0
  grid = []
  File.readlines("three.txt").each do |line|
    grid[i] = line.chomp
    i += 1
  end

  width = grid[0].length

  trees = 0
  x = 0
  y = 0

  while y < grid.length
    trees += 1 if grid[y][x % width] == '#'
    y += 1
    x += 3
  end

  puts trees
end

main