# https://leetcode.com/problems/valid-parentheses/
# @param {String} s
# @return {Boolean}

CLOSING_CHAR = {
  '[' => ']',
  '{' => '}',
  '(' => ')'
}

def is_valid(s)
  # validates allowed characters in parentheses
  return false unless allowed_characters?(s)

  # validates matching parentheses
  queue = []
  

  s.each_char do |char|
    matcher = queue.first

    if !matcher.nil? && char == CLOSING_CHAR[matcher]
      queue.shift
    else
      queue.unshift(char)
    end

    puts "current queue: #{queue.join}"
    puts "current char: #{char}"
  end

  return false if queue.length != 0
  true
end

def allowed_characters?(str)
  str =~ /[(){}\[\]]/
end

s = '()[]{}'
# s = '(({[({})]}))' # 2nd sample, will return true
# s = '{[][()]}()[{}]' # 3rd sample, will return true
# s = '][}{)(' # 4th sample, will return false
# s = '[]]}{' # 4th sample, will return false 
puts is_valid(s)