class CycleManager
  attr_reader :cycle, :seconds

  def initialize
    cycle_kill
  end

  # clear out cycle state
  def cycle_kill
    @cycle = RunState::OFF
    @seconds = 0
  end

  # move the time forward for the cycle and return the count
  def tick
    @seconds = (@seconds + 1) % cycle_duration
    next_cycle if @seconds == 0
    @seconds
  end

  private
  
    # Number of seconds in current cycle 
    # (+1 to avoid divide by zero, and lack of hitting cycle duration number)
    def cycle_duration
      ((@cycle + 1) * 10) + 1
    end
   
    # Iterate to the next active cycle 
    def next_cycle
      @cycle = (@cycle + 1) % 3
    end
end