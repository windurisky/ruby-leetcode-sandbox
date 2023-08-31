# Sorting:
# Sort the input and then perform further processing or search.
# Beware for large array, sort will be inefficient.
# Useful for problems where a sorted order provides advantages.

# Problem: Kth Largest Element in an Array
def find_kth_largest(nums, k)
  nums.sort[-k]
end
