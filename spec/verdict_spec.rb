require 'spec_helper'

describe Verdict do
  describe "#tabulate" do
    subject { verdict }
    
    context "majority of opinionated people think gif is a hard g" do
      let(:verdict) { Verdict.new( [
               [:soft, :hard, :none],
               [:hard, :none, :soft],
               [:hard, :soft, :hard],
              ]) }
              
      it "should tabulate results" do
        result = verdict.tabulate()
        expect(result).to eq(:hard)
      end
    end
    
    context "majority of opinionated people think gif is a soft g" do
      let(:verdict) { Verdict.new( [
               [:soft, :soft, :soft],
               [:hard, :none, :soft],
               [:hard, :soft, :hard],
              ]) }
              
      it "should tabulate results" do
        result = verdict.tabulate()
        expect(result).to eq(:soft)
      end
    end
    
    context "push when opinions are equal" do
      let(:verdict) { Verdict.new( [
               [:soft, :soft, :soft],
               [:soft, :none, :hard],
               [:hard, :hard, :hard],
              ]) }
              
      it "should tabulate results" do
        result = verdict.tabulate()
        expect(result).to eq(:push)
      end
    end
  end
end