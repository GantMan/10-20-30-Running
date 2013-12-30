class NoticeState
  include RunState
  attr_reader :cycle

  def initialize
    @cycle = RunState::OFF
  end

  def next_state

  end



end