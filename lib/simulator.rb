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
    new_seating_arrangement = []
    @seating_arrangement.each_with_index do |x, xindex|
      x.each_with_index do |y, yindex|
        neighbours = neighbour.find(xindex, yindex)
        rules = Rules.new(x, neighbours)
        new_seating_arrangement << rules.check
      end
    end
    @seating_arrangement = new_seating_arrangement
  end

end
