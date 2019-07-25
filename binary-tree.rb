# 1. Binary Tree Preorder Traversal
#
# Given a binary tree, return the preorder traversal of its nodes' values.
#
# Example:
#
# Input: [1,null,2,3]
#    1
#     \
#      2
#     /
#    3
#
# Output: [1,2,3]
# Follow up: Recursive solution is trivial, could you do it iteratively?

def preorder_traversal(root)
  return [] if root.nil?
  # create a stack and add root to it
  stack = [root]
  results = []
  # until stack is empty, take the first element from stack and add it to results
  until stack.empty?
    current_node = stack.pop
    results.push current_node.val
  # add right node to the stack, if it exists, and/or left node to the stack, if it exists
    stack.push current_node.right if current_node.right
    stack.push current_node.left if current_node.left
  end
  results
end
