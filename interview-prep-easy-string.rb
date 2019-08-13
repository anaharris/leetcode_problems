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

# 4. Valid Anagram
#
# Given two strings s and t , write a function to determine if t is an anagram of s.
#
# Example 1:
#
# Input: s = "anagram", t = "nagaram"
# Output: true
#
# Example 2:
#
# Input: s = "rat", t = "car"
# Output: false
#
# Note:
# You may assume the string contains only lowercase alphabets.
#
# Follow up:
# What if the inputs contain unicode characters? How would you adapt your solution to such case?
#
# Solution:

def is_anagram(s, t)
  return false if s.length < t.length
  s_hash = {}

  s.chars.each do |c|
    s_hash[c] ? s_hash[c] += 1 : s_hash[c] = 1
  end

  t.chars.each do |c|
    if s_hash[c] && s_hash[c] != 0
      s_hash[c] -= 1
    else
      return false
      break
    end
  end
  true
end

# 5. Valid Palindrome
#
# Given a string, determine if it is a palindrome, considering only alphanumeric
# characters and ignoring cases.
#
# Note: For the purpose of this problem, we define empty string as valid palindrome.
#
# Example 1:
#
# Input: "A man, a plan, a canal: Panama"
# Output: true
#
# Example 2:
#
# Input: "race a car"
# Output: false
#
# Solution:

def is_palindrome(s)
  return true if s == ''
  new_s = s.gsub(/[^0-9A-Za-z]/, '').downcase!
  new_s = new_s.reverse
end

# 6. Implement strStr()
#
# Implement strStr().
#
# Return the index of the first occurrence of needle in haystack, or -1 if
# needle is not part of haystack.
#
# Example 1:
#
# Input: haystack = "hello", needle = "ll"
# Output: 2
#
# Example 2:
#
# Input: haystack = "aaaaa", needle = "bba"
# Output: -1

# Clarification:
#
# What should we return when needle is an empty string? This is a great question
# to ask during an interview.
#
# For the purpose of this problem, we will return 0 when needle is an empty string.
# This is consistent to C's strstr() and Java's indexOf().
#
# Solution:

def str_str(haystack, needle)
  return 0 if needle.empty?

  (0...haystack.length).each do |i|
    if haystack[i..i + needle.length - 1] == needle
      return i
    end
  end
  -1
end

# 7. Longest Common Prefix
#
# Write a function to find the longest common prefix string amongst an array of strings.
#
# If there is no common prefix, return an empty string "".
#
# Example 1:
#
# Input: ["flower","flow","flight"]
# Output: "fl"
#
# Example 2:
#
# Input: ["dog","racecar","car"]
# Output: ""
#
# Explanation: There is no common prefix among the input strings.
#
# Note:
# All given inputs are in lowercase letters a-z.
#
# Solution:

def longest_common_prefix(strs)
  return '' if strs.empty? || strs.nil?

  prefix = strs.min_by {|w| w.length}

  strs.each do |word|
    while word.index(prefix) != 0
      prefix = prefix[0...prefix.length - 1]
    end
  end

  prefix
end
