require_relative "../display.rb"

class Pawn
    attr_reader :color
    attr_reader :location
    include Display

    def initialize(color, location)
        @location = location
        @color = color
        #pawn moves forward by one or two in the first step, only one in the nexts.
        #space needed to be selected.
        @white_move = [[-1, 0], [-2, 0]]
        @black_move = [[+1, 0], [+2 ,0]]
        @movable_space = []
    end
    
    def push_unicode
        return ";97m\u2659" if @color == "white"
        return ";90m\u265F" if @color == "black"
    end

    def selectable?(board)
        #this piece can not jump, then the surrounding should has no pieces.
        feedback = false
        update_space()
        @space.each do |movement|
            row = movement[0]
            column = movement[1]
            next if board[row][column] == nil
            feedback = true if board[row][column] == ""
        end
        puts invalid_selection unless feedback 
        return feedback   
    end

    def update_space()
        length = @space.length
        row = location[0]
        column = location[1]
        length.times do |i|
            @space[i][0] += row
            @space[i][1] += column
        end
        delete_impossible()
    end

    def delete_impossible
        length = @space.length
        container = []
        length.times do |i|
            row = @space[i][0] 
            column = @space[i][1]    
            container << @space[i] if row.between?(0,7) && column.between?(0,7)
        end
        @space = container
    end

end