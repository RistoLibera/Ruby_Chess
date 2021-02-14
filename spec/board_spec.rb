
require_relative "../lib/board.rb"

RSpec.describe Board do
    describe "#get_background" do
        subject(:board){ described_class.new}

        it "returns the right white color" do
            row_index = 2
            column_index = 2
            background = board.get_background(column_index, row_index)
            expect(background).to eql "47"
        end

        it "returns the right black color" do
            row_index = 0
            column_index = 1
            background = board.get_background(column_index, row_index)
            expect(background).to eql "40"
        end
    end
    
    describe "#selected_position?" do
        subject(:board){ described_class.new}
        let(:chess){ double("chesspiece", location: [1, 1])}
        it "returns true if position is selected" do
            row = 1
            column = 1
            allow(board).to receive(:selected_chess).and_return("")
            result = board.selected_position?(row, column)
            expect(result).to eql(false)
        end

        it "returns false if position is not selected" do
            row = 1
            column = 1
            board.instance_variable_set(:@selected_chess, chess)
            result = board.selected_position?(row, column)
            expect(result).to eql(true)
        end
    end

    describe "" do
        subject(){ described_class.new}

        it "" do
        end
    end

    describe "" do
        subject(){ described_class.new}

        it "" do
        end
    end

    describe "" do
        subject(){ described_class.new}

        it "" do
        end
    end






end