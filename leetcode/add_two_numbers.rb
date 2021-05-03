# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end

def add_two_numbers(l1, l2)
  result = []
  extra = 0
  while l1 || l2
    result << 0
    result[result.length - 1] += extra  
    if l1
      result[result.length - 1] += l1.val
      l1 = l1.next
    end
    if l2
      result[result.length - 1] += l2.val
      l2 = l2.next
    end
    if result[result.length - 1] > 9
      temp = result[result.length - 1] 
      result[result.length - 1] = temp.to_s[1].to_i
      extra = temp.to_s[0].to_i
    else
      extra = 0   
    end 
  end
  extra > 0 ? result << extra : result
end