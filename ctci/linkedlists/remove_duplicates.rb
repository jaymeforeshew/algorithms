require './node'

# remove duplicates from an unsorted linked list
def remove_duplicates(head)
  nodes_seen = {}

  ptr = head
  while (ptr != nil)
    nodes_seen[ptr.value] = 1
    
    if nodes_seen[ptr.next.value] != nil
      ptr.put_next(ptr.next.next)
    end

    ptr = ptr.next
  end
end

# test
head = Node.new(0)
curr_head = head
(1..10).each do |i|
  node = nil
  if i % 2 == 0
    node = Node.new(2)
  else
    node = Node.new(i)
  end

  curr_head.put_next(node)
  curr_head = node
end

remove_duplicates(head)
head.print_em() # should print out 0, 1, 2, 3, 5, 7, 9

# Follow up - what would you do if you couldn't use a temporary buffer? 
# Ans: Brute force it.