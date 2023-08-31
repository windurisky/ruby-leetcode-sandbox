# Binary Search:
# Divide the search space in half at each step to find a target element efficiently.
# Useful for problems with a sorted input or monotonic properties.

# Problem: Search in Rotated Sorted Array
def search(nums, target)
  left, right = 0, nums.length - 1
  while left <= right
    mid = left + (right - left) / 2
    return mid if nums[mid] == target
    if nums[left] <= nums[mid]
      if nums[left] <= target && target < nums[mid]
        right = mid - 1
      else
        left = mid + 1
      end
    else
      if nums[mid] < target && target <= nums[right]
        left = mid + 1
      else
        right = mid - 1
      end
    end
  end
  -1
end