# Dynamic Programming:
# Break down a problem into smaller subproblems and solve each subproblem only once, storing the results to avoid recomputation.
# Two main types: top-down (memoization) and bottom-up (tabulation).
# Useful for problems with overlapping subproblems and optimal substructure.

# Problem: Fibonacci Sequence (Top-Down DP)
def fib(n, memo = {})
  return memo[n] if memo.key?(n)
  return n if n <= 1
  memo[n] = fib(n - 1, memo) + fib(n - 2, memo)
end