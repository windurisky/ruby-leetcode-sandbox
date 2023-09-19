# https://www.hackerrank.com/challenges/palindrome-index

# Given a string of lowercase letters in the range ascii[a-z],
# determine the index of a character that can be removed to make the string a palindrome.
# There may be more than one solution, but any will do. If the word is already a palindrome or there is no solution, return -1.
# Otherwise, return the index of a character to remove.

# Example:
# s = "bcbc"
# Either remove 'b' at index  or 'c' at index .

# Function Description

# Complete the palindromeIndex function in the editor below.

# palindromeIndex has the following parameter(s):
# string s: a string to analyze

# Returns 
# int: the index of the character to remove, or -1 if already palindrome in the first place

# The first line contains an integer , the number of queries.
# Each of the next  lines contains a query string .

# Constraints
# 1 <= s.length <= 10^5 + 5
# All characters are in the range ascii[a-z].

def palindromeIndex(s)
    total_length = s.length

    s.each_char.with_index do |_, index|
        reverse_index = total_length - 1 - index
        break if index >= reverse_index
        
        next if s[index] == s[reverse_index]
        
        return index if is_palindrome? s[index + 1..reverse_index]
        return reverse_index if is_palindrome? s[index..reverse_index - 1]
    end
    
    return -1
end

def is_palindrome?(s)
    s == s.reverse
end

s = "hgygsvlfcwnswtuhmyaljkqlqjjqlqkjlaymhutwsnwcwflvsgygh"
p palindromeIndex(s) # expected output 44

s = "aaa"
p palindromeIndex(s) # expected output -1

s = "babcbacb"
p palindromeIndex(s) # expected output 6