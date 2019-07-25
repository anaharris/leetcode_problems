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
  # create a stack and add the argument root to it
  stack = [root]
  results = []
  # until stack is full, take the first element from stack and add it to results
  until stack.empty?
    current_node = stack.pop
    # add value of the current node to results
    results.push current_node.val
    # add current node's left and right children to the stack
    stack.push current_node.right if current_node.right
    stack.push current_node.left if current_node.left
  end
  results
end
