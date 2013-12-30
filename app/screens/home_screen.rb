class HomeScreen < PM::Screen
  include HomeStyles

  title "Home"

  def on_load
    set_nav_bar_button :left, title: "Help", action: :help_tapped
    set_nav_bar_button :right, title: "Settings", action: :states_tapped
    draw_seconds 0 
  end

  def will_appear
    @view_setup ||= self.set_up_view
  end

  def set_up_view
    set_attributes self.view, :home_view_style 
    title = add FBBitmapFontView.new, :title_label_style
    text_label = add UILabel.new, :label_view_style
    @seg = add UISegmentedControl.bar(["Start","Stop"]), :segment_style

    @seg.on(:change) { 
      ap "Touched! #{@seg.titleForSegmentAtIndex @seg.selectedSegmentIndex}"
      case @seg.selectedSegmentIndex
      when 0 # start
        start_timer
      else # end
        kill_timer
      end
    }
    true
  end

  private 

  def start_timer
    @timer = 1.second.every do
      @time.removeFromSuperview if @time 
      @time = draw_seconds(Time.now.sec)
    end
  end

  def kill_timer
    @timer.invalidate if @timer
    draw_seconds 0
  end

  def states_tapped
    open StatesScreen
  end

  def help_tapped
    open_modal HelpScreen.new(nav_bar: true)
  end

  def draw_seconds message
    frame = CGRectMake(80, 250, 300, 50)
    v = FBLCDFontView.alloc.initWithFrame(frame)
    v.text = "%02d" % message # force leading zeros
    v.lineWidth = 8
    v.drawOffLine = true
    v.edgeLength = 40
    v.margin = 10
    v.backgroundColor = :black.uicolor
    v.horizontalPadding = 30
    v.verticalPadding = 14
    v.glowSize = 10.0
    v.glowColor = 0x00ffff.uicolor
    v.innerGlowColor = 0x00ffff.uicolor
    v.innerGlowSize = 3.0
    self.view.addSubview(v)
    v.resetSize
    return v
  end
end
