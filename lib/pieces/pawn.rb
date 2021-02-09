
class Pawn
    def initialize(color, location)
        @location = location
        @color = color
    end
    
    def push_unicode
        return ";97m\u2659" if @color == "white"
        return ";90m\u265F" if @color == "black"
    end
end