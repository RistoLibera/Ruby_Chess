require_relative "../display.rb"

class Rook
    attr_reader :color
    attr_reader :location
    attr_reader :movable_space
    include Display

    def initialize(color, location)
        @location = location
        @color = color
        #rook moves vertically and horizontally.
        #space needed to be selected.
        @move = [[+1, 0], [-1, 0], [0, +1], [0, -1]]
        @movable_space = []
    end

    def push_unicode
        return ";97m\u2656" if @color == "white"
        return ";90m\u265C" if @color == "black"
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