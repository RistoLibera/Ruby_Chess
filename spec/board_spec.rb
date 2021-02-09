
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
end