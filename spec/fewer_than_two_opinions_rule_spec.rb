require 'spec_helper'

#if a person with an opinion has fewer than 2 opinionated neighbours
#then they stop having an opinion since there is not 
#enough people to argue with.

describe FewerThanTwoOpinionatedNeighbours do
  describe "#apply" do
    subject { fewer_than_two_opinionated_neighbours_rule }
    
    context "when a person's neighbours aren't opinionated" do
      let(:fewer_than_two_opinionated_neighbours_rule) { 
        FewerThanTwoOpinionatedNeighbours.new(:soft, [:soft, :none, :none]) }
        
        it "doesn't have an opinion anymore" do
          new_opinion = fewer_than_two_opinionated_neighbours_rule.apply()
          expect(new_opinion).to eq(:none)
        end
    end
    
    context "when a person's neighbours are opinionated" do
      let(:fewer_than_two_opinionated_neighbours_rule) { 
        FewerThanTwoOpinionatedNeighbours.new(:soft, [:soft, :soft, :hard]) }
        
        it "doesn't apply" do
          new_opinion = fewer_than_two_opinionated_neighbours_rule.apply()
          expect(new_opinion).to eq(:soft)
        end
    end

  end
end