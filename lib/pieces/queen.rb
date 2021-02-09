
class Queen
    def initialize(color, location)
        @location = location
        @color = color
    end

    def push_unicode
        return ";97m\u2655" if @color == "white"
        return ";90m\u265B" if @color == "black"
    end
end