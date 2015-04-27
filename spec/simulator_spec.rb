require 'spec_helper'

describe Simulator do

  let(:simulator) do
    Simulator.new(initial_state)
  end


  context "scenarios" do
    shared_examples "correct_state" do
      it { should eql resulting_state }
      it "should have the verdict" do
        expect(simulator.verdict).to eql verdict
      end
    end
    before do
      simulator.next
    end
    subject { simulator.state }
    context "#1" do
      let(:initial_state) do
        [
         [:soft, :hard, :none],
         [:hard, :none, :soft],
         [:none, :soft, :hard],
        ]
      end
      let(:resulting_state) do
        [
         [:soft, :hard, :none],
         [:hard, :none, :soft],
         [:none, :soft, :hard]
        ]
      end
      let(:verdict) { :push }
      include_examples "correct_state"
      
    end

    context "#2" do
      let(:initial_state) do
        [
         [:soft, :hard, :none],
         [:hard, :none, :soft],
         [:soft, :soft, :hard],
        ]
      end
      let(:resulting_state) do
        [
         [:soft, :hard, :none],
         [:none, :none, :soft],
         [:soft, :none, :hard]
        ]
      end
      let(:verdict) { :soft }

      include_examples "correct_state"
    end

    context "#3" do
      let(:initial_state) do
        [
         [:soft, :hard, :none, :soft],
         [:hard, :none, :soft, :hard],
         [:none, :none, :none, :soft],
         [:none, :soft, :hard, :none],
        ]
      end
      let(:resulting_state) do
        [
         [:soft, :hard, :none, :soft],
         [:hard, :none, :none, :hard],
         [:none, :none, :none, :soft],
         [:none, :none, :hard, :none],
        ]
      end
      let(:verdict) { :hard }

      include_examples "correct_state"
    end

    context "#4" do
      let(:initial_state) do
        [
         [:soft, :hard, :hard, :soft],
         [:none, :none, :none, :none],
         [:none, :none, :none, :none],
         [:hard, :soft, :hard, :soft],
        ]
      end
      let(:resulting_state) do
        [
         [:none, :hard, :hard, :none],
         [:none, :hard, :hard, :none],
         [:none, :hard, :soft, :none],
         [:none, :soft, :hard, :none],
        ]
      end
      let(:verdict) { :hard }

      include_examples "correct_state"
    end

    context "#5" do
      let(:initial_state) do
        [
         [:none, :hard, :hard, :none],
         [:none, :hard, :hard, :none],
         [:none, :soft, :soft, :none],
         [:none, :soft, :soft, :none],
        ]
      end
      let(:resulting_state) do
        [
         [:none, :hard, :hard, :none],
         [:hard, :none, :none, :hard],
         [:soft, :none, :none, :soft],
         [:none, :soft, :soft, :none],
        ]
      end
      let(:verdict) { :push }

      include_examples "correct_state"
    end
  end

end
