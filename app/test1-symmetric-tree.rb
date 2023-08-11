# https://leetcode.com/problems/symmetric-tree/
# 
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Boolean}



##
# The basic idea to populate the TreeNode is by using 2 array variables; `queue` and `array`
# We utilize the ruby native array `shift` method to simultaneously retrieve and remove the first element from an array 
# `queue` acts as the root of tree node,
# `array` acts as the left and right value of the tree node

def build_tree_from_array(array)
  return nil if array.empty?

  root = TreeNode.new(array.shift)
  queue = [root]

  while !queue.empty?
    puts "start of loop"
    node = queue.shift
    puts "take from queue"
    puts node.val

    left_value = array.shift
    if left_value
      node.left = TreeNode.new(left_value)
      queue.push(node.left)
    end

    right_value = array.shift
    if right_value
      node.right = TreeNode.new(right_value)
      queue.push(node.right)
    end

    puts "take from array for left and right"
    puts "#{left_value} left" if left_value
    puts "#{right_value} right" if right_value
    puts "end of loop\n\n"
  end

  root
end

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end
  
def self.is_symmetric(root)
  return true if root.nil?
  is_mirror(root.left, root.right)
end

def self.is_mirror(left, right)
  return true if left.nil? && right.nil?
  return false if left.nil? || right.nil?
  
  # this is where the magic happens
  # check the mirror recursively through the children nodes
  (left.val == right.val) && is_mirror(left.left, right.right) && is_mirror(left.right, right.left)
end

tree_values = [1, 2, 2, 3, 4, 4, 3, 4, 5, 6, 7, 7, 6, 5, 4]
root = build_tree_from_array(tree_values)

puts is_symmetric(root)  # Output: true