require_relative "display.rb"

class Human
    attr_reader :name
    attr_reader :faction
    attr_reader :identity
    include Display
    
    def initialize(name = "example", faction = "white")
        @name = name
        @faction = faction
        @identity = "human"
    end

    # The human gets to choose first.
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