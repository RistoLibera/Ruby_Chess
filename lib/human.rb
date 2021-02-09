require_relative "display.rb"

class Human
    include Display
    def initialize(player_name, faction = "white")
        @player_name = player_name
        @faction = faction
    end

    def choose_faction
        puts black_or_white
        input = gets.chomp
        if input == "w"
            @faction = "white"
            return @faction
        elsif input == "b"
            @faction = "black"
            return @faction
        else
            puts input_error
            choose_faction()
        end
    end


end