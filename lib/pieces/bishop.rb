
class Bishop
    def initialize(color, location)
        @location = location
        @color = color
    end
    
    def push_unicode
        return ";97m\u2657" if @color == "white"
        return ";90m\u265D" if @color == "black"
    end
end