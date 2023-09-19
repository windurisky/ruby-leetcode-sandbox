# https://www.hackerrank.com/challenges/extra-long-factorials

# the factorial of the integer n, written as n!, is defined as:
# n! = n * (n-1) * (n-2) * ... * 3 * 2 * 1

# Calculate and print the factorial of a given integer.
# For example, if n = 25, we calculate 25 * 24 * 23 * ... * 3 * 2 * 1
# and get 15511210043330985984000000

def extraLongFactorials(n)
    puts factorial(n)
end

def factorial(n)
    return n if n == 1
    
    n * factorial(n-1)
end

n = 25
extraLongFactorials(n) # expected output 15511210043330985984000000