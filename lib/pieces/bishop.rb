require_relative "../display.rb"

class Bishop
    attr_reader :color
    attr_reader :location
    include Display

    def initialize(color, location)
        @location = location
        @color = color
        #bishop moves diagonally.
        @move = [[-1, +1], [+1, +1], [-1, -1], [+1, -1]]
        @movable_space = []
    end
    
    def push_unicode
        return ";97m\u2657" if @color == "white"
        return ";90m\u265D" if @color == "black"
    end

    def movable?(board)
        feedback = false
        update_space()
        feedback = true if @movable_space.length != 0
        puts invalid_selection unless feedback 
        return feedback   
    end



    def update_space()
        @move.each do |move|
            row =
            column =
            position = @board[row][column]
            until position == nil || position != "" do
                
                
            end

        end

        until @board == nil or @board has value != ""


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