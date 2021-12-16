require_relative "../display.rb"

class Bishop
    attr_reader :color
    attr_accessor :location
    attr_reader :movable_space
    attr_reader :has_promotion
    include Display

    def initialize(color, location)
        @location = location
        @color = color
        #bishop moves diagonally.
        @move = [[-1, +1], [+1, +1], [-1, -1], [+1, -1]]
        @movable_space = []
        @has_promotion = false
    end
    
    # reverse actual color code for a better experience
    def push_unicode
        return ";30m\u265D" if @color == "black"
        return ";30m\u2657" if @color == "white"
    end

    def movable?(board)
        feedback = false
        update_space(board)
        feedback = true if @movable_space.length != 0
        puts invalid_selection unless feedback 
        return feedback   
    end

    def update_space(board)
        @movable_space = []
        @move.each do |move|
            row = move[0] + @location[0]
            column = move[1] + @location[1]
            while row.between?(0, 7) && column.between?(0, 7) do
                position = board[row][column]
                if position == ""
                    @movable_space << [row,column]
                    row += move[0]
                    column += move[1]
                elsif position.color != @color
                    @movable_space << [row,column]
                    break
                else
                    break
                end
            end
        end
    end
    
end