class Simulator

  def initialize(seating_arrangement)
    @seating_arrangement = seating_arrangement
  end

  def verdict
    verdict = Verdict.new(@seating_arrangement)
    verdict.tabulate
  end

  def state
    @seating_arrangement
  end

  def next
    neighbour = Neighbour.new(@seating_arrangement)
    new_seating_arrangement = Array.new(@seating_arrangement[0].length) {
    Array.new(@seating_arrangement.length)} 
    
    @seating_arrangement.each_with_index do |x, xindex|
      x.each_with_index do |y, yindex|
        neighbours = neighbour.find(xindex, yindex)
        rules = Rules.new(y, neighbours)
        rule_result = rules.check
        new_seating_arrangement[xindex][yindex] = rule_result
      end
      
    end

    @seating_arrangement = new_seating_arrangement
    return @seating_arrangement
  end

end
