# Say you have an array for which the ith element is the price of a given stock on day i.
#
# Design an algorithm to find the maximum profit. You may complete as many transactions
# as you like (i.e., buy one and sell one share of the stock multiple times).
#
# Note: You may not engage in multiple transactions at the same time (i.e., you
# must sell the stock before you buy again).
#
# Example 1:
#
# Input: [7,1,5,3,6,4]
# Output: 7
# Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
#              Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.
#
# Example 2:
#
# Input: [1,2,3,4,5]
# Output: 4
# Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
#              Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are
#              engaging multiple transactions at the same time. You must sell before buying again.
#
# Example 3:
#
# Input: [7,6,4,3,1]
# Output: 0
# Explanation: In this case, no transaction is done, i.e. max profit = 0.
#
# ------------------------------------------------------------------------------
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
# Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
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
# Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.
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
