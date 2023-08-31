# Bit Manipulation:
# Utilize bitwise operations to manipulate and extract information from integers.
# Useful for problems involving subsets, permutations, and binary representation.

# Problem: Single Number
def single_number(nums)
  result = 0
  nums.each { |num| result ^= num }
  result
end