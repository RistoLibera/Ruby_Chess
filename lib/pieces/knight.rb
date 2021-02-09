
class Knight
    def initialize(color, location)
        @location = location
        @color = color
    end
    
    def push_unicode
        return ";97m\u2658" if @color == "white"
        return ";90m\u265E" if @color == "black"
    end
end