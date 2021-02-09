require_relative "board.rb"
require_relative "human.rb"
require_relative "computer.rb"
require_relative "save_and_load.rb"
require_relative "display.rb"

class Game
    include Display
    def initialize(existed_name = "")
        @player_one = ""
        @player_two = ""
        @existed_name = ""
        @game_board = ""
        @count = 0
    end

    def start_game
        puts start_message
        choose_playmode()
    end

    def choose_playmode
        input = gets.chomp.to_i
        case input
        when 1
            initialize_player(input)
            get_game_board()
        when 2
            initialize_player(input)
            get_game_board()
        when 3
            #load
        else
            puts input_error
            choose_playmode()
        end    
    end

    def initialize_player(game_mode)
        faction = initialize_player_one()
        initialize_player_two(faction, game_mode)
    end

    def initialize_player_one
        puts player_one_prompt
        name = get_player_name()
        @existed_name = name
        @player_one = Human.new(name)
        return faction_feedback(@player_one)  
    end

    def faction_feedback(player)
        faction = player.choose_faction
        if faction == "white"
            return "black"
        elsif faction == "black"
            return "white"
        else 
            puts "Error!"
        end
    end

    def initialize_player_two(faction, game_mode)
        puts player_two_prompt
        name = get_player_name()
        @player_two = Human.new(name, faction) if game_mode == 2
        @player_two = Computer.new(name, faction) if game_mode == 1
    end

    def get_player_name
        name = gets.chomp
        until name.length >= 2 && name != @existed_name do
            puts input_error
            name = gets.chomp
        end
        return name
    end

    def get_game_board
        @game_board = Board.new
        @game_board.initialize_board
    end

end

game = Game.new
game.start_game