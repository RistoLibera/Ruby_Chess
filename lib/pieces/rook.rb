
class Rook
    def initialize(color, location)
        @location = location
        @color = color
    end

    def push_unicode
        return ";97m\u2656" if @color == "white"
        return ";90m\u265C" if @color == "black"
    end    
end