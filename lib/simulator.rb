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
    puts "Seating arrangemnet #{@seating_arrangement.inspect}"
    neighbour = Neighbour.new(@seating_arrangement)
    new_seating_arrangement = Array.new(@seating_arrangement[0].length) {
    Array.new(@seating_arrangement.length)} 
    
    @seating_arrangement.each_with_index do |x, xindex|
      x.each_with_index do |y, yindex|
        neighbours = neighbour.find(xindex, yindex)
        rules = Rules.new(y, neighbours)
        rule_result = rules.check
        puts "Index #{xindex}, #{yindex} #{@seating_arrangement[xindex][yindex]} applied rule is #{rule_result} neighbours #{neighbours} east neighbour #{neighbour.east_neighbour(xindex, yindex)} west neighbour #{neighbour.west_neighbour(xindex, yindex)}"
        new_seating_arrangement[xindex][yindex] = rule_result
        if(xindex == 1 && yindex == 0)
          puts "NEW arrangemnet #{new_seating_arrangement[xindex][yindex]}"
        end
      end
      
    end
    puts "Seating arrangemnet result #{new_seating_arrangement.inspect}"
    @seating_arrangement = new_seating_arrangement
    return @seating_arrangement
  end

end
