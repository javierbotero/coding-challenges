class MyCircularQueue
=begin
    :type k: Integer
=end
    def initialize(k)
      @array = Array.new(k)
      @front = -1
      @rear = -1
      @size = k
    end


=begin
    :type value: Integer
    :rtype: Boolean
=end
    def en_queue(value)
      return false if is_full

      if @rear == @size - 1
        @rear = 0
      elsif @front < 0 && @rear < 0
        @rear = @front = 0
      else
        @rear += 1
      end

      @array[@rear] = value
      true
    end

=begin
    :rtype: Boolean
=end
    def de_queue()
      return false if @front < 0 && @rear < 0

      if @front == @rear
        @front = @rear = -1
      elsif @front == @size - 1
        @front = 0
      else
        @front += 1
      end

      true
    end


=begin
    :rtype: Integer
=end
    def front()
      @front < 0 ? -1 : @array[@front]
    end


=begin
    :rtype: Integer
=end
    def rear()
      @rear < 0 ? -1 : @array[@rear]
    end


=begin
    :rtype: Boolean
=end
    def is_empty()
       @front < 0 && @rear < 0
    end


=begin
    :rtype: Boolean
=end
    def is_full()
      @front == 0 && @rear == @size - 1 ||
        @rear == @front - 1
    end


end

# Your MyCircularQueue object will be instantiated and called as such:
# obj = MyCircularQueue.new(k)
# param_1 = obj.en_queue(value)
# param_2 = obj.de_queue()
# param_3 = obj.front()
# param_4 = obj.rear()
# param_5 = obj.is_empty()
# param_6 = obj.is_full()