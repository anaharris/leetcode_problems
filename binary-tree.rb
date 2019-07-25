# 1. Binary Tree Preorder Traversal ()=> root, left, right)
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

# recursive
def preorder_traversal(root)
  response = []
  traversal(root, response)
  return response
end

def traversal(node, result)
  return if node.nil?
  result << node.val
  traversal(node.left, result)
  traversal(node.right, result)
end

# iterative
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

# 2. Binary Tree Inorder Traversal (=> left, root, right)
#
# Given a binary tree, return the inorder traversal of its nodes' values.
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
# Output: [1,3,2]
# Follow up: Recursive solution is trivial, could you do it iteratively?

# recursive
def inorder_traversal(root)
  response = []
  traverse(root, response)
  return response
end

def traverse(node, response)
  # break out of the function if the current node doesn't exist
  return if node.nil?

  # traverse node's left child
  traverse(node.left, response)
  # add current node's value to response
  response << node.val
  # add node's right child
  traverse(node.right, response)
end

# iterative
def inorder_traversal(root)
  return [] if root.nil?
  current = root
  stack = []
  response = []

  # iterate while current node exists and stack is full
  while !(current.nil? and stack.empty?)
    # while current node exists
    while current
      # add it to the stack
      stack.push(current)
      # and set its left child to be the current
      current = current.left
      # this way we get all the left nodes in the stack, with the deepest one on the top
    end

    # we take a node from the stack, which happens to be the deepest left node
    current = stack.pop
    # add its value to result
    response << current.val
    # set its right node to the current one
    current = current.right
  end

  return response
end

# 3. Binary Tree Postorder Traversal (=> left, right, root)
#
# Given a binary tree, return the postorder traversal of its nodes' values.
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
# Output: [3,2,1]
# Follow up: Recursive solution is trivial, could you do it iteratively?

# recursive
def postorder_traversal(root)
  response = []
  traverse(root, response)
  return response
end

def traverse(node, response)
  return if node.nil?
  traverse(node.left, response)
  traverse(node.right, response)
  response << node.val
end

# iterative
def postorder_traversal(root)
  return [] if root.nil?
  stack = [root]
  response = []

# until there are nodes in stack, grab the first one and set it to current
  until stack.empty?
    current = stack.pop
    # if current is integer, add it to results
    if current.is_a? Integer
      result << current
    else
    # if it's not an integer, add its value to stack, then add its right child,
    # and then its left child
      stack << current.val
      stack << current.right if current.right
      stack << current.left if current.left
    end
  end

  # 
  result
end
