require_relative "pieces/bishop.rb"
require_relative "pieces/king.rb"
require_relative "pieces/knight.rb"
require_relative "pieces/pawn.rb"
require_relative "pieces/queen.rb"
require_relative "pieces/rook.rb"
require_relative "display.rb"
require_relative "human.rb"
require_relative "computer.rb"

class Board
    attr_reader :board
    include Display
    
    def initialize
        # Row is counted from top to bottom, and column left to right.
        # "" is empty block on board, and nil will be out of board.
        @board = Array.new(8){ Array.new(8){""}}
        @selected_chess = ""
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

    #select chess
    def select_chess(round_count, player)
        show_board()
        puts selection_hint(round_count, player.name, player.faction)
        get_chess(player.faction)
    end

    # move chess
    def move_chess(round_count, player)
        show_board()
        puts movement_hint(round_count, player.name)
        
        #take_chess()
        # @selected_chess = ""
    end

    #Subfunctions of select_chess and move_chess
    def get_chess(player_faction)
        range = /^[a-h][1-8]$/i
        input = gets.chomp
        until input.match?(range) && check_selected(input, player_faction) do
            puts input_error
            input = gets.chomp
        end

        
    end

    def check_selected(input, faction)
        array = convert_input(input)
        chess = @board[array[1]][array[0]]
        if chess != "" && chess.color == faction && chess.movable?(@board)
            @selected_chess = chess
            return true
        else
            return false
        end
        # around places have or have not chesses?
    end

    def convert_input(input)
        array = input.split("")
        # 0 is column, 1 is row.
        array[0] = convert_char(array[0]).to_i
        array[1] = (8 - array[1].to_i).to_i
        return array
    end

    def convert_char(input)
        case input
        when "a"
            return "0"
        when "b"
            return "1"
        when "c"
            return "2"
        when "d"
            return "3"
        when "e"
            return "4"
        when "f"
            return "5"
        when "g"
            return "6"
        when "h"
            return "7"
        else
            puts "Error!"
        end
    end

    # display board in the terminal
    def show_board
        @board.each_with_index do |columns, row_index|
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
        if selected_position?(column_index, row_index)
            print "\e[46m  \e[0m"
        elsif potential_movement?(column_index, row_index)
            print "\e[41m  \e[0m"
        elsif co_ord != ""
            print "\e[#{background}#{co_ord.push_unicode} \e[0m"  
        elsif
            print "\e[#{background}m  \e[0m"  
        end
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

    def selected_position?(column_index, row_index)
        return false if @selected_chess == ""
        return true if @selected_chess.location == [row_index, column_index]
    end

    def potential_movement?(column_index, row_index)
        each do
        @selected_chess.movable_space
        return true 
        or 
        return false
    end

end