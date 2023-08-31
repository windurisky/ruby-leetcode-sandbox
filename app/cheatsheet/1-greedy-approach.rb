# Greedy Approach:
# Make the locally optimal choice at each step without worrying about its global impact.
# Useful for problems where you want to maximize or minimize something (e.g., maximizing intervals, minimizing distances).

# Problem: Jump Game
def can_jump(nums)
  max_reachable = 0
  nums.each_with_index do |jump, i|
    return false if i > max_reachable
    max_reachable = [max_reachable, i + jump].max
  end
  max_reachable >= nums.length - 1
end