require_relative "../display.rb"

class Knight
    attr_reader :color
    attr_reader :location
    attr_reader :movable_space
    include Display

    def initialize(color, location)
        @location = location
        @color = color
        #knight moves by L shape.
        #space needed to be selected.
        @move = [[-2, -1], [-2, +1], [+2, -1], [+2, +1], [-1, -2], [+1, -2], [-1, +2], [+1, +2]]
        @movable_space = []
    end
    
    def push_unicode
        return ";97m\u2658" if @color == "white"
        return ";90m\u265E" if @color == "black"
    end


    def movable?(board)
        feedback = false
        update_space(board)
        feedback = true if @movable_space.length != 0
        puts invalid_selection unless feedback 
        return feedback   
    end

    def update_space(board)
        @move.each do |move|
            row = move[0] + @location[0]
            column = move[1] + @location[1]
            break unless row.between?(0,7) && column.between?(0,7)
            position = board[row][column]
            @movable_space << [row,column] if position == "" || position.color != @color
        end
    end
end

