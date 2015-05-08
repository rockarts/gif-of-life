require 'spec_helper'

#If a person without an opinion has exactly 3 opinionated neighbours 
#and at least 2 of them think "Gif" is pronounced with a hard G then they form 
#an opinion that it is pronounced with a hard G

describe HardGifRule do
  describe "#apply" do
    subject { hard_gif_rule }
    
    context "when a person's neighbours think Gif is pronounced with a hard G" do
      let(:hard_gif_rule) { 
        HardGifRule.new(:none, [:soft, :hard, :hard]) }
        
        it "doesn't have an opinion anymore" do
          new_opinion = hard_gif_rule.apply()
          expect(new_opinion).to eq(:hard)
        end
    end

    context "when a person has less than three opinionated neighbours" do
      let(:hard_gif_rule) { 
        HardGifRule.new(:none, [:soft, :hard, :none, :none]) }
        
        it "doesn't have an opinion anymore" do
          new_opinion = hard_gif_rule.apply()
          expect(new_opinion).to eq(:none)
        end
    end

  end
end