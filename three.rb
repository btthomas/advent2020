def calc(grid, x_speed, y_speed)
  width = grid[0].length

  trees = 0
  x = 0
  y = 0

  while y < grid.length
    trees += 1 if grid[y][x % width] == '#'
    y += y_speed
    x += x_speed
  end

  trees
end

def main
  i = 0
  grid = []
  File.readlines("three.txt").each do |line|
    grid[i] = line.chomp
    i += 1
  end

  slopes = [
    [1, 1],
    [3, 1],
    [5, 1],
    [7, 1],
    [1, 2],
  ]

  counts = []
  product = 1

  slopes.each do |slope|
    count = calc(grid, *slope)
    counts << count
    product *= count
  end

  puts counts
  puts product
end

main