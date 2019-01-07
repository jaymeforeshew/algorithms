# Singly Linked list class that I'll be using for these questions
class Node
  attr_reader :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end

  def put_next(node)
    @next = node
  end

  def print_em()
    puts @value
    
    ptr = @next
    while (ptr != nil)
      puts ptr.value
      ptr = ptr.next
    end
  end
end
