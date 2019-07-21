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
# -----------------------------------------------------------------------------
#
# Solution:

def is_anagram(s, t)
  s_hash = {}

  if t.length < s.length
    return false
  end

  s.chars.each do |letter|
      s_hash[letter] ? s_hash[letter] += 1 : s_hash[letter] = 1
  end

  t.chars.each do |letter|
    if s_hash[letter] && s_hash[letter] != 0
      s_hash[letter] -= 1
    else
     return false
     break
    end
  end
  true
end
