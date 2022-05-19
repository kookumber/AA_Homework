class Stack
    def initialize
        # create ivar to store stack here!
        @ivar = []
    end

    def push(ele)
        # adds an element to the stack
        @ivar.push(ele)
    end

    def pop
        # removes one element from the stack
        @ivar.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @ivar[-1]
    end
end

class Queue

    def initialize
        @ivar = []
    end

    def enqueue(ele)
        @ivar.unshift(ele)
    end

    def dequeue
        @ivar.pop
    end

    def peek
        @ivar[-1]
    end

end

class Map
    def initialize
        @ivar = []
    end

    def set(key, value)
        @ivar << [key, value]
    end

    def get(key)
        @ivar.select { |ele| ele[0] == key}
    end

    def show()
        return @ivar
    end
end