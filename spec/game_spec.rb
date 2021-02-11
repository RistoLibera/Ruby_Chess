require_relative "../lib/game.rb"

RSpec.describe Game do
    describe "#faction_feedback" do
        subject(:game){ described_class.new}
        let(:human){instance_double(Human)}

        it "returns correct factions" do
            allow(human).to receive(:choose_faction).and_return("white")
            another_faction = game.faction_feedback(human)
            expect(another_faction).to eql("black")
        end
    end

    describe "#initialize_player_two" do
        subject(:game){ described_class.new}
        let(:human){instance_double(Human)}
        let(:computer){instance_double(Computer)}
        before do
            allow(game).to receive(:puts)
        end

        it "creates right human player" do
            name = "test"
            allow(game).to receive(:get_player_name).and_return(name)
            faction = "black"
            game_mode = 2
            game.initialize_player_two(faction, game_mode)
            player_two = game.instance_variable_get(:@player_two)
            expect(player_two).to respond_to(:choose_faction)
        end

        it "creates right computer player" do
            name = "test"
            allow(game).to receive(:get_player_name).and_return(name)
            faction = "black"
            game_mode = 1
            game.initialize_player_two(faction, game_mode)
            player_two = game.instance_variable_get(:@player_two)
            expect(player_two).not_to respond_to(:choose_faction)
        end
    end


    describe "#get_player_name" do
        subject(:game){ described_class.new}

        it "returns name" do
            name = "test"
            allow(game).to receive(:gets).and_return(name)
            result = game.get_player_name
            expect(result).to eql(name)
        end

        it "outputs error when receiving too short name" do
            wrong_name = "t"
            right_name = "test"
            allow(game).to receive(:gets).and_return(wrong_name, right_name)
            expect(game).to receive(:puts).once
            game.get_player_name
        end
    end


    describe "" do
        subject(:game){ described_class.new}

        it "" do
        end
    end

end



