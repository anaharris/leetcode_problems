# Given a string, find the first non-repeating character in it and return
# it's index. If it doesn't exist, return -1.
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
# -----------------------------------------------------------------------------
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
