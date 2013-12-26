class HomeScreen < PM::Screen
  include HomeStyles

  title "Home"

  def on_load
    set_nav_bar_button :left, title: "Help", action: :help_tapped
    set_nav_bar_button :right, title: "States", action: :states_tapped

    #draw_bitmap_font
    v = FBBitmapFontView.alloc.initWithFrame(CGRectMake(10, 200, 300, 50))
    v.text = "Yo"
    view.addSubview(v)
  end

  def will_appear
    @view_setup ||= self.set_up_view
  end

  def set_up_view
    set_attributes self.view, :home_view_style # found in HomeStyles module
    add UILabel.new, :label_view_style

    true
  end

  def states_tapped
    open StatesScreen
  end

  def help_tapped
    open_modal HelpScreen.new(nav_bar: true)
  end

  private

  def draw_bitmap_font
    frame = CGRectMake(10, 200, 300, 50)
    v = FBBitmapFontView.alloc.initWithFrame(frame)
    v.text = "Hai"
    v.dotType = FBFontDotTypeSquare
    v.numberOfBottomPaddingDot = 1
    v.numberOfTopPaddingDot = 1
    v.numberOfLeftPaddingDot = 2
    v.numberOfRightPaddingDot = 2
    v.glowSize = 20.0
    v.innerGlowSize = 3.0
    v.edgeLength = 5.0
    self.view.addSubview(v)
    v.resetSize
    v.centerizeInWidth(320)
  end
end
