require_relative "display.rb"

class Computer
    include Display    
    def initialize(name, faction = "black")
        @name = name
        @faction = faction
    end
end