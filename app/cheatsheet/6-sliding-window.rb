# Sliding Window:
# Problem: Minimum Size Subarray Sum
def min_sub_array_len(s, nums)
  left = 0
  min_length = Float::INFINITY
  sum = 0
  (0...nums.length).each do |right|
    sum += nums[right]
    while sum >= s
      min_length = [min_length, right - left + 1].min
      sum -= nums[left]
      left += 1
    end
  end
  min_length == Float::INFINITY ? 0 : min_length
end
