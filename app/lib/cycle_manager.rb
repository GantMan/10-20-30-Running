class CycleManager
  attr_reader :cycle, :seconds

  def initialize
    cycle_kill
  end

  def next_cycle
    @cycle = (@cycle + 1) % 3
  end

  def cycle_duration
    (@cycle + 1) * 10
  end

  def cycle_kill
    @cycle = RunState::OFF
  end
end