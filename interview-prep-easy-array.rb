# 1. Remove duplicates sorted array
#
# Given a sorted array nums, remove the duplicates in-place such that each
# element appear only once and return the new length.
#
# Do not allocate extra space for another array, you must do this by modifying
# the input array in-place with O(1) extra memory.
#
# Example 1:
#
# Given nums = [1,1,2],
#
# Your function should return length = 2, with the first two elements of nums
# being 1 and 2 respectively.
#
# It doesn't matter what you leave beyond the returned length.
# Example 2:
#
# Given nums = [0,0,1,1,1,2,2,3,3,4],
#
# Your function should return length = 5, with the first five elements of nums
# being modified to 0, 1, 2, 3, and 4 respectively.
#
# It doesn't matter what values are set beyond the returned length.
#
# Solution 1:

def remove_duplicates(nums)
  nums.uniq!
  return nums.length
end

# 2. Best time to buy and sell stock II
#
# Say you have an array for which the ith element is the price of a given stock on day i.
#
# Design an algorithm to find the maximum profit. You may complete as many
# transactions as you like (i.e., buy one and sell one share of the stock multiple times).
#
# Note: You may not engage in multiple transactions at the same time
# (i.e., you must sell the stock before you buy again).
#
# Example 1:
#
# Input: [7,1,5,3,6,4]
# Output: 7
# Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
#              Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
# Example 2:
#
# Input: [1,2,3,4,5]
# Output: 4
# Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
#              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
#              engaging multiple transactions at the same time. You must sell before buying again.
# Example 3:
#
# Input: [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transaction is done, i.e. max profit = 0.
#
# Solution:

def max_profit(prices)
  profit = 0

  prices.each_with_index do |p, i|
      if prices[i + 1] && p < prices[i + 1]
          profit += (prices[i + 1] - p)
      end
  end

  profit
end

# 3. Rotate Array
#
# Given an array, rotate the array to the right by k steps, where k is non-negative.
#
# Example 1:
#
# Input: [1,2,3,4,5,6,7] and k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]
# Example 2:
#
# Input: [-1,-100,3,99] and k = 2
# Output: [3,99,-1,-100]
# Explanation:
# rotate 1 steps to the right: [99,-1,-100,3]
# rotate 2 steps to the right: [3,99,-1,-100]
# Note:
#
# Try to come up as many solutions as you can, there are at least 3 different
# ways to solve this problem.
# Could you do it in-place with O(1) extra space?
#
# Solution 1:

def rotate(nums, k)
  k.times do
    temp = nums.pop
    nums.unshift(temp)
  end
  nums
end

# Solution 2:

def rotate(nums, k)
  nums.rotate!(-k)
end

# 4.  Contains Duplicate
#
# Given an array of integers, find if the array contains any duplicates.
#
# Your function should return true if any value appears at least twice in the
# array, and it should return false if every element is distinct.
#
# Example 1:
#
# Input: [1,2,3,1]
# Output: true
# Example 2:
#
# Input: [1,2,3,4]
# Output: false
# Example 3:
#
# Input: [1,1,1,3,3,4,3,2,4,2]
# Output: true
#
# Solution:

def contains_duplicate(nums)
  return false if nums.empty?
  map = {}
  nums.each do |n|
    map[n] ? (return true) : map[n] = 1
  end
  false
end

# 5. Single Number
#
# Given a non-empty array of integers, every element appears twice except for one.
# Find that single one.
#
# Note:
#
# Your algorithm should have a linear runtime complexity. Could you implement it
 # without using extra memory?
#
# Example 1:
#
# Input: [2,2,1]
# Output: 1
# Example 2:
#
# Input: [4,1,2,1,2]
# Output: 4
#
# Solution:

def single_number(nums)
  count_nums = {}
  nums.each do |n|
    count_nums[n] ? count_nums[n] +=1 : count_nums[n] = 1
  end
  count_nums.key(1)
end

# 6. Intersection of Two Arrays II
#
# Given two arrays, write a function to compute their intersection.
#
# Example 1:
#
# Input: nums1 = [1,2,2,1], nums2 = [2,2]
# Output: [2,2]
# Example 2:
#
# Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
# Output: [4,9]
# Note:
#
# Each element in the result should appear as many times as it shows in both arrays.
# The result can be in any order.
# Follow up:
#
# What if the given array is already sorted? How would you optimize your algorithm?
# What if nums1's size is small compared to nums2's size? Which algorithm is better?
# What if elements of nums2 are stored on disk, and the memory is limited such that
# you cannot load all elements into the memory at once?
#
# Solution:

def intersect(nums1, nums2)
  map = {}
  result = []

  nums1.each do |n|
    map[n] ? map[n] +=1 : map[n] =1
  end

  nums2.each do |n|
    if map[n]
      if map[n] > 0
        result << n
        map[n] -= 1
      end
    end
  end
  result
end

# 7. Plus One
#
# Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
#
# The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
#
# You may assume the integer does not contain any leading zero, except the number 0 itself.
#
# Example 1:
#
# Input: [1,2,3]
# Output: [1,2,4]
# Explanation: The array represents the integer 123.
# Example 2:
#
# Input: [4,3,2,1]
# Output: [4,3,2,2]
# Explanation: The array represents the integer 4321.
#
# Solution:

def plus_one(digits)
  i = digits.length - 1

  while digits[i] === 9
    digits[i] = 0
    i -= 1
  end

  if i < 0
    digits.unshift(0)
    i = 0
  end

  digits[i] += 1
  digits
end

# 8. Move Zeroes
#
# Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.
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
# Solution:

def move_zeroes(nums)
  zero_count = nums.count(0)
  nums.delete_if {|n| n == 0}
  zero_count.times {nums << 0}
  nums
end

# 9. Two Sum
#
# Given an array of integers, return indices of the two numbers such that they add up to a specific target.
#
# You may assume that each input would have exactly one solution, and you may not use the same element twice.
#
# Example:
#
# Given nums = [2, 7, 11, 15], target = 9,
#
# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].
#
# Solution 1:

def two_sum(nums, target)
  map = {}

  nums.each_with_index do |n, i|
    map[i] = n
  end

  map.each do |k, v|
    if map.key(target - v) && map.key(target - v) != v
      return [k, map.key(target - v)]
  end
end

# Solution 2:

def two_sum(nums, target)
  nums_hash = {}
  nums.each_with_index do |num, i|
    nums_hash[target-num] ? nums_hash[target-num].push(i) : nums_hash[target-num] = [i]
  end

  nums.each_with_index do |num, i|
    if nums_hash[num] && nums_hash[num].first != i
      if nums_hash[num].length == 2
        return nums_hash[num]
      else
        return nums_hash[num].push(i)
      end
    end
  end
end
