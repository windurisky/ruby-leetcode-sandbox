# BFS explores nodes level by level, while DFS explores as far as possible along a branch before backtracking.
# Useful for searching, traversal, and pathfinding problems.

# Breadth-First Search (BFS):
# Problem: Word Ladder
def ladder_length(begin_word, end_word, word_list)
  return 0 unless word_list.include?(end_word)

  word_list = Set.new(word_list)
  queue = [[begin_word, 1]]

  while !queue.empty?
    word, steps = queue.shift

    if word == end_word
      return steps
    end

    word.length.times do |i|
      ('a'..'z').each do |c|
        new_word = word.dup
        new_word[i] = c

        if word_list.include?(new_word)
          word_list.delete(new_word)
          queue.push([new_word, steps + 1])
        end
      end
    end
  end

  return 0
end

# Depth-First Search:
# Problem: Number of Islands (DFS)
def num_islands(grid)
  return 0 if grid.empty?
  count = 0
  (0...grid.length).each do |i|
    (0...grid[0].length).each do |j|
      if grid[i][j] == "1"
        dfs(grid, i, j)
        count += 1
      end
    end
  end
  count
end

def dfs(grid, i, j)
  return if i < 0 || i >= grid.length || j < 0 || j >= grid[0].length || grid[i][j] == "0"
  grid[i][j] = "0"
  dfs(grid, i - 1, j)
  dfs(grid, i + 1, j)
  dfs(grid, i, j - 1)
  dfs(grid, i, j + 1)
end