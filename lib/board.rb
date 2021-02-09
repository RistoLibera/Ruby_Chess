require_relative "pieces/bishop.rb"
require_relative "pieces/king.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/rook.rb"
require_relative "display.rb"

class Board
    include Display
    def initialize
        # Row is counted from top to bottom
        @board = Array.new(8){ Array.new(8)}
    end

    def initialize_board
        initialize_row(0)
        initialize_row(1)
        initialize_row(6)
        initialize_row(7)
    end

    def initialize_row(row_index)
        case row_index
        when 0
            @board[0] = [
                Rook.new("black", [0, 0]),
                Knight.new("black", [0, 1]),
                Bishop.new("black", [0, 2]),
                Queen.new("black", [0, 3]),
                King.new("black", [0, 4]),
                Bishop.new("black", [0, 5]),
                Knight.new("black", [0, 6]),
                Rook.new("black", [0, 7])   
            ]
        when 1
            8.times do |column|
                @board[1][column] = Pawn.new("black", [1, column])
            end
        when 6
            8.times do |column|
                @board[6][column] = Pawn.new("white", [6, column])
            end
        when 7
            @board[7] = [
                Rook.new("white", [7, 0]),
                Knight.new("white", [7, 1]),
                Bishop.new("white", [7, 2]),
                Queen.new("white", [7, 3]),
                King.new("white", [7, 4]),
                Bishop.new("white", [7, 5]),
                Knight.new("white", [7, 6]),
                Rook.new("white", [7, 7])    
            ]
        end
    end

    def show_board(board)
        board.each_with_index do |columns, row_index|
            print "\e[36m  #{8 - row_index} \e[0m"
            columns.each_with_index do |co_ord, column_index|
                update_borad(co_ord, column_index, row_index) 
            end
            puts ""
        end
        puts "\e[36m    a b c d e f g h \e[0m"
    end

    def update_borad(co_ord, column_index, row_index)
        background = get_background(column_index, row_index)
        print "\e[#{background}#{co_ord.push_unicode} \e[0m" unless co_ord.nil?
        print "\e[#{background}m  \e[0m" if co_ord.nil?
    end

    def get_background(column_index, row_index)
        if row_index % 2 == 0
            return "47" if column_index % 2 == 0
            return "40" if column_index % 2 == 1
        elsif row_index % 2 == 1
            return "40" if column_index % 2 == 0
            return "47" if column_index % 2 == 1
        else
            puts "Error!"
        end
    end

    

end