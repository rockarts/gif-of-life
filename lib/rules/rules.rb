class Rules
  
  def initialize(opinion, neighbours)
    @opinion = opinion
    @neighbours = neighbours
    @rules = [FewerThanTwoOpinionatedNeighbours.new(opinion, neighbours), 
    DrownedOutOpinionRule.new(opinion, neighbours), 
    HardGifRule.new(opinion, neighbours),
    SoftGifRule.new(opinion, neighbours)]
  end
  
  def check
    @rules.each do |x| 
      if(x.apply != @opinion)
        @opinion = x.apply
        break
      end
    end
    @opinion
  end
end