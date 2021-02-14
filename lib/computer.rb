require_relative "display.rb"

class Computer
    attr_reader :name
    attr_reader :faction
    attr_reader :identity
    include Display 
       
    def initialize(name, faction = "black")
        @name = name
        @faction = faction
        @identity = "computer"
    end

    def decide_select(chessboard)
        container = []
        8.times do |row|
            8.times do |column|
                position = chessboard.board[row][column]
                container << [row, column] if position != "" && 
                                            position.color == @faction &&
                                            position.movable?(chessboard.board)                              
            end
        end
        output = container.sample
        return output
    end

    def decide_move(board)
        space = board.selected_chess.movable_space
        output = space.sample
        return output
    end

    def decide_promotion
        promotion = ["b", "k", "r", "q"]
        output = promotion.sample
        return output
    end
end