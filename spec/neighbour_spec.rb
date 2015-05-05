require 'spec_helper'

describe Neighbour do
  describe "#find" do
    subject { neighbour }
 
    context "with seating arrangement" do
      let(:neighbour) { Neighbour.new( [
               [:soft, :hard, :none],
               [:hard, :none, :soft],
               [:none, :soft, :hard],
              ]) }
 
      it "should locate North West neighbour" do 
          north_west = neighbour.find(1,1)
          expect(north_west[0]).to eq(:soft)
      end
      
      it "should locate North neighbour" do
        north = neighbour.find(1,1)
        expect(north[1]).to eq(:hard)
      end
      
      it "should locate North East neighbour" do
        north_east = neighbour.find(1,1)
        expect(north_east[2]).to eq(:none)
      end
      
      it "should locate East neighbour" do
        east = neighbour.find(1, 1)
        expect(east[3]).to eq(:hard)
      end
      
      it "should locate West neighbour" do
        west = neighbour.find(1, 1)
        expect(west[4]).to eq(:soft)
      end
      
      it "should locate South West neighbour" do
        south_west = neighbour.find(1, 1)
        expect(south_west[5]).to eq(:none)
      end
      
      it "should locate South neighbour" do
        south = neighbour.find(1, 1)
        expect(south[6]).to eq(:soft)
      end
      
      it "should locate South East neighbour" do
        south_east = neighbour.find(1, 1)
        expect(south_east[7]).to eq(:hard)
      end
      
      it "should not find a North neighbour when in the top row" do
        north = neighbour.north_neighbour(0,0)
        expect(north).to eq(nil)
      end
    end
  end
end
