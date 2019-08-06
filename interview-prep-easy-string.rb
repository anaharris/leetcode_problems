# 1. Reverse String
#
# Write a function that reverses a string. The input string is given as an array of characters char[].
#
# Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
#
# You may assume all the characters consist of printable ascii characters.
#
#
#
# Example 1:
#
# Input: ["h","e","l","l","o"]
# Output: ["o","l","l","e","h"]
# Example 2:
#
# Input: ["H","a","n","n","a","h"]
# Output: ["h","a","n","n","a","H"]
#
# Solution:

def reverse_string(s)
  i = 0
  j = s.length - 1

  while i < s.length/2
    s[i], s[j] = s[j], s[i]
    i += 1
    j -= 1
  end
  s
end

# 2. Reverse Integer
#
# Given a 32-bit signed integer, reverse digits of an integer.
#
# Example 1:
#
# Input: 123
# Output: 321
# Example 2:
#
# Input: -123
# Output: -321
# Example 3:
#
# Input: 120
# Output: 21
#
# Note:
# Assume we are dealing with an environment which could only store integers within
# the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem,
# assume that your function returns 0 when the reversed integer overflows.
#
# Solution:

def reverse(x)
  result = x.to_s.reverse.to_i
  if if result > 2**31 - 1 || result < -2**31
    result = 0
  elsif x < 0
    result = result * -1
  end
  result
end

# 3. First Unique Character in a String
#
# Given a string, find the first non-repeating character in it and return it's index.
# If it doesn't exist, return -1.
#
# Examples:
#
# s = "leetcode"
# return 0.
#
# s = "loveleetcode",
# return 2.
#
# Note: You may assume the string contain only lowercase letters.
#
# Solution:

def first_uniq_char(s)
  map = {}
  s.each_char.each do |char, i|
    map[char] ? map[char] += 1 : map[char] = 1
  end

  s.each_char.each_with_index do |char, i|
    if map[char] == 1
      return i
    end
  end
  -1
end
