require_relative "../display.rb"

class Pawn
    attr_reader :color
    attr_reader :location
    attr_reader :movable_space
    include Display

    def initialize(color, location)
        @location = location
        @color = color
        #pawn moves forward by one or two in the first step, only one in the nexts.
        @movable_space = []
        @replace = []
        @has_promotion = true
    end
    
    def push_unicode
        return ";97m\u2659" if @color == "white"
        return ";90m\u265F" if @color == "black"
    end


    def movable?(board)
        feedback = false
        update_space(board)
        feedback = true if @movable_space.length != 0
        puts invalid_selection unless feedback 
        return feedback   
    end

    #when in the original co-ord has the choice to move one or two
    def update_space(board)
        row = @location[0]
        column = @location[1]
        case @color
        when "black"
            @movable_space << [2, column] if row == 1 && board[2][column] == ""
            @movable_space << [3, column] if row == 1 && board[3][column] == ""
            @movable_space << [row + 1, column] if (row + 1).between?(0, 7) && board[row + 1][column] == ""
            @movable_space << [row + 1, column - 1] if board[row + 1][column - 1] != ""
            @movable_space << [row + 1, column + 1] if board[row + 1][column + 1] != ""
        when "white"
            @movable_space << [5, column] if row == 6 && board[5][column] == ""
            @movable_space << [4, column] if row == 6 && board[4][column] == ""
            @movable_space << [row - 1, column] if (row - 1).between?(0, 7) && board[row - 1][column] == ""
            @movable_space << [row - 1, column - 1] if board[row - 1][column - 1] != ""
            @movable_space << [row - 1, column + 1] if board[row - 1][column + 1] != ""
        else
            puts "Error!"
        end    
    end
end