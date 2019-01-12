class Node
    attr_accessor :timestamp, :count, :next
    
    def initialize(timestamp)
        @timestamp = timestamp
        @count = 1
        @next = nil
    end
end

class HitCounter
    def initialize()
        @tail = nil # tail will be where we pop off
        @head = nil # head will be where we insert to
        @sum = 0
    end

    def hit(timestamp)
        if @head.nil?
            @head = Node.new(timestamp)
            @tail = @head
            @sum = 1
            return
        end
        
        @sum += 1
        
        if @head.timestamp == timestamp
            @head.count += 1
            return
        end
        
        new_node = Node.new(timestamp)
        @head.next = new_node
        @head = new_node
        
        remove_expired_nodes(timestamp)
        return
    end

    def remove_expired_nodes(timestamp)
        return if @tail == nil
            
        first_valid_timestamp = timestamp - (5*60) + 1
        first_valid_timestamp <= 0 ? 1 : first_valid_timestamp
        
        node_ptr = @tail
        
        while node_ptr.timestamp < first_valid_timestamp
            @sum -= node_ptr.count
            @tail = node_ptr.next
            node_ptr = @tail
            
            if @tail.nil?
                @head = nil
                break
            end
        end
    end
    
    def get_hits(timestamp)
        remove_expired_nodes(timestamp)
        
        return @sum
    end
end
