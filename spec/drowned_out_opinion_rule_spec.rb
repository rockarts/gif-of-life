require 'spec_helper'

#If a person with an opinion has more than 3 opinionated neighbours then 
#they stop having an opinion since their opinion is drowned out by their
#neighbours.

describe DrownedOutOpinionRule do
  describe "#apply" do
    subject { drowned_out_opinion_rule }
    
    context "when a person's neighbours are highly opinionated" do
      let(:drowned_out_opinion_rule) { 
        DrownedOutOpinionRule.new([:soft, :hard, :hard, :soft]) }
        
        it "doesn't have an opinion anymore" do
          new_opinion = drowned_out_opinion_rule.apply()
          expect(new_opinion).to eq(:none)
        end
    end

    context "when a person has less than three opinionated neighbours" do
      let(:drowned_out_opinion_rule) { 
        DrownedOutOpinionRule.new([:soft, :hard, :none, :none]) }
        
        it "doesn't have an opinion anymore" do
          new_opinion = drowned_out_opinion_rule.apply()
          expect(new_opinion).to eq(nil)
        end
    end

  end
end