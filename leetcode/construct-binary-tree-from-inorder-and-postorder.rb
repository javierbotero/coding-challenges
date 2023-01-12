# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
class Node
  attr_accessor :left, :right, :value, :index

  def initialize(value, index = 0)
    self.value = value
    self.index = index
  end
end

def build_tree(inorder, postorder)
  root = build_node_tree(inorder, postorder)
  make_array_tree(root)
end

def build_node_tree(inorder, postorder, index_result = 0)
  root = Node.new(postorder.pop, index_result)
  index = inorder.index(root.value)

  return root if index && inorder.length == 1

  left_inorder = inorder.slice(0, index)
  right_inorder = inorder.slice(index + 1, inorder.length)
  left_index_result = (index_result * 2) + 1
  right_index_result = (index_result * 2) + 2

  root.right = build_node_tree(right_inorder, postorder, right_index_result) if right_inorder.any?

  root.left = build_node_tree(left_inorder, postorder, left_index_result) if left_inorder.any?

  root
end

def make_array_tree(node_root)
  result = []
  queue = [node_root]

  while queue.any?
    head = queue.shift
    result[head.index] = head.value
    queue.push(head.left) if head.left
    queue.push(head.right) if head.right
  end

  result
end

# running in the console should return true

puts build_tree([9,3,15,20,7], [9,15,7,20,3]) == [3,9,20,nil,nil,15,7]
puts build_tree([2,7,4,1,8,5,9,3,6], [7,4,2,8,9,5,6,3,1]) == [1, 2, 3, nil, 4, 5, 6, nil, nil, 7, nil, 8, 9]
# the before could be [1, 2, 3, nil, 4, 5, 6, nil, nil, 7, nil, 8, 9, nil, nil] but this solution wouldn't create extra nils
puts build_tree([2,1,3], [2,3,1]) == [1, 2, 3]
puts build_tree([1], [1]) == [1]
