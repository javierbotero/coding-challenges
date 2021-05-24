# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {Void} Do not return anything, modify head in-place instead.
def reorder_list(head)
  arr = []
  tmp_head = head
  until tmp_head.nil?
    arr.push(tmp_head.val)
    tmp_head = tmp_head.next
  end
  i = 0
  tmp_head = head
  while arr.length > 0
    if i.even?
      tmp_head.val = arr.shift
    else
      tmp_head.val = arr.pop
    end
    tmp_head = tmp_head.next
    i += 1
  end
end


