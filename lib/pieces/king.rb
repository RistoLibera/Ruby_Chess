
class King
    def initialize(color, location)
        @location = location
        @color = color
    end
    
    def push_unicode
        return ";97m\u2654" if @color == "white"
        return ";90m\u265A" if @color == "black"
    end
end