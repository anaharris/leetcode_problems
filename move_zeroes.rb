# Given an array nums, write a function to move all 0's to the end of it while
# maintaining the relative order of the non-zero elements.
#
# Example:
#
# Input: [0,1,0,3,12]
# Output: [1,3,12,0,0]
#
# Note:
# 1. You must do this in-place without making a copy of the array.
# 2. Minimize the total number of operations.
#
#
# ----------------------------------------------------------------------------
# Solution:

def move_zeroes(nums)
  zero_count = nums.count(0)
  nums.delete_if {|n| n == 0}
  zero_count.times {nums << 0}
  nums
end
