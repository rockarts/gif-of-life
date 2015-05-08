require 'spec_helper'

#If a person without an opinion has exactly 3 opinionated neighbours and
#at least 2 of them think "Gif" is pronounced with a soft G then they form an
#opinion that it is pronounced with a soft G

describe SoftGifRule do
  describe "#apply" do
    subject { soft_gif_rule }
    
    context "when a person without a opinion neighbours think Gif is pronounced with a soft G" do
      let(:soft_gif_rule) { 
        SoftGifRule.new(:none, [:soft, :soft, :hard]) }
        
        it "changes it's opinion to soft" do
          new_opinion = soft_gif_rule.apply()
          expect(new_opinion).to eq(:soft)
        end
    end

    context "when a person has less than three opinionated neighbours" do
      let(:soft_gif_rule) { 
        SoftGifRule.new(:none, [:soft, :hard, :none, :none]) }
        
        it "continues to not have an opinion" do
          new_opinion = soft_gif_rule.apply()
          expect(new_opinion).to eq(:none)
        end
    end

  end
end