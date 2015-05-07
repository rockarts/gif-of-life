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
    @seating_arrangement.each do |x|
      
    end
  end

end
