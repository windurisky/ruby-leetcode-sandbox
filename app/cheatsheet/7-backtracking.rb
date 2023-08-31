# Backtracking:
# Generate all possible solutions by trying out different options and undoing choices when necessary.
# Useful for problems involving permutations, combinations, or exhaustive search.

# Problem: N-Queens
def solve_n_queens(n)
  result = []
  solve(n, 0, [], result)
  result
end

def solve(n, row, board, result)
  if row == n
    result << board.map { |col| '.' * col + 'Q' + '.' * (n - col - 1) }
    return
  end
  (0...n).each do |col|
    if is_safe?(board, row, col)
      board.push(col)
      solve(n, row + 1, board, result)
      board.pop
    end
  end
end

def is_safe?(board, row, col)
  (0...row).each do |prev_row|
    return false if board[prev_row] == col || (board[prev_row] - col).abs == (row - prev_row).abs
  end
  true
end
