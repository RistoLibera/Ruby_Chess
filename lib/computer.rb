require_relative "display.rb"

class Computer
    include Display    
    def initialize(player_name, faction)
        @player_name = player_name
        @faction = faction
    end
end