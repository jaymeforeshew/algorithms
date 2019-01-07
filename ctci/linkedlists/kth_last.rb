require './node'

# Implement an algorithm to find the kth last to last element of a singly linked list.

def kth_last(k, head)
  # one pass to get length
  curr_head = head
  length = 0
  while (curr_head != nil)
    length += 1
    curr_head = curr_head.next
  end

  # second pass to (length +1 - k)th element
  ptr = head
  (length - k).times do
    ptr = ptr.next
  end

  return ptr.value
end

# test
head = Node.new(100)
curr_head = head
(101..110).each do |i|
  node = Node.new(i)
  curr_head.put_next(node)
  curr_head = node
end

puts "4th last should return 107: #{kth_last(4, head)}"
puts "1st last should return 110: #{kth_last(1, head)}"
puts "11th last should return 100: #{kth_last(11, head)}"