require_relative "../lib/human.rb"

RSpec.describe Human do
    describe "#choose_faction" do
        subject(:human){ described_class.new}
        
        it "returns white when inputting w" do
            allow(human).to receive(:gets).and_return("w")
            returning = human.choose_faction
            expect(returning).to eql("white")
        end

        it "returns black when inputting b" do
            allow(human).to receive(:gets).and_return("b")
            returning = human.choose_faction
            expect(returning).to eql("black")
        end

        it "puts error message once when inputting others once" do
            allow(human).to receive(:gets).and_return("1", "b")
            expect(human).to receive(:puts).exactly(3).times
            human.choose_faction
        end
    end
end