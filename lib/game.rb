require_relative "board.rb"
require_relative "human.rb"
require_relative "computer.rb"
require_relative "save_and_load.rb"
require_relative "display.rb"

class Game
    include Display
    include GameData
    def initialize(existed_name = "")
        @player_one = ""
        @player_two = ""
        @existed_name = ""
        @game_board = ""
        @round_count = 0
        @loser = ""
        @winner = ""
    end

    # First Execution
    def start_game
        puts start_message
        choose_playmode()
    end
    
    # subfucntions of start_game
    def choose_playmode
        input = gets.chomp.to_i
        case input
        when 1
            initialize_player(input)
            get_game_board()
            play_turn()
        when 2
            initialize_player(input)
            get_game_board()
            play_turn()
        when 3
            #load
        else
            puts input_error
            choose_playmode()
        end    
    end

    def initialize_player(game_mode)
        another_faction = initialize_player_one()
        initialize_player_two(another_faction, game_mode)
    end

    def initialize_player_one
        puts player_one_prompt
        name = get_player_name()
        @existed_name = name
        @player_one = Human.new(name)
        another_faction = faction_feedback(@player_one)  
        return another_faction
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

    # Second Execution
    def play_turn
        until 1 == 0 do
            @round_count += 1
            player_action(@round_count, @player_one)
            break if has_winner?
            player_action(@round_count, @player_two)  
            break if has_winner?  
        end
        game_over_option()
    end

    def player_action(round_count, player)
        @game_board.select_chess(round_count, player)
        @loser = @game_board.move_chess(round_count, player)
    end

    def has_winner?
        if @player_one.faction == @loser
            @winner = @player_two
            return true
        elsif @player_two.faction == @loser
            @winner = @player_one
            return true
        else
            return false
        end
    end

    def game_over_option
        puts game_over(@round_count, @winner.name, @winner.faction)
        input = gets.chomp.to_i
        case input
        when 1
          start_game()
        when 2
           #load
        else
            return
        end    
    end

end

game = Game.new
game.start_game