require 'spec_helper'

describe Rules do
  describe "#check" do
    subject { rules }
    
    context "neigbours are not opinionated" do
      let(:neighbours) { [:soft, :none, :none] }
      let(:rules) { Rules.new(:soft, neighbours) }
              
      it "should only apply the fewer than two opinionated neighbours rule" do
        result = rules.check()
        expect(result).to eq(:none)
      end
    end
    
    context "neigbours are very opinionated" do
      let(:neighbours) { [:soft, :hard, :none, :soft, :hard] }
      let(:rules) { Rules.new(:hard, neighbours) }
              
      it "should only apply the drowned out opinion rule" do
        result = rules.check()
        expect(result).to eq(:none)
      end
    end
    
    context "neigbours think gif is pronounced with a hard G" do
      let(:neighbours) { [:hard, :hard, :none] }
      let(:rules) { Rules.new(:none, neighbours) }
              
      it "should only apply the hard gif rule" do
        result = rules.check()
        expect(result).to eq(:hard)
      end
    end
    
    context "neigbours think gif is pronounced with a soft G" do
      let(:neighbours) { [:soft, :soft, :none]}
      let(:rules) { Rules.new(:none, neighbours) }
              
      it "should only apply the hard gif rule" do
        result = rules.check()
        expect(result).to eq(:soft)
      end
    end
    
  end
end