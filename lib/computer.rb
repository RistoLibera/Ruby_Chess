require_relative "display.rb"

class Computer
    attr_reader :name
    attr_reader :faction
    include Display 
       
    def initialize(name, faction = "black")
        @name = name
        @faction = faction
    end
end