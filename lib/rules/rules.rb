class Rules
  
  def initialize(neighbours)
    @neighbours = neighbours
    @rules = [FewerThanTwoOpinionatedNeighbours.new(neighbours), 
    DrownedOutOpinionRule.new(neighbours), 
    HardGifRule.new(neighbours),
    SoftGifRule.new(neighbours)]
  end
  
  def check
    @rules.each do |x| 
      applied_rule = x.apply 
      if(applied_rule != nil)
        return applied_rule
      end
    end
  end
end