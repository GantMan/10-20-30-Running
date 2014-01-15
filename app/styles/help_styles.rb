module HelpStyles
  def help_label_style
    {
      text: "It's a Copenhagen University training concept that improves runner performance.  I've personaly used it to go from barely running a single mile, to running 10k races.  The 10-20-30 training concept can improve both a person's running performance and health, despite a significant reduction in the total amount of training.",
      text_color: UIColor.whiteColor,
      background_color: UIColor.clearColor,
      shadow_color: UIColor.blackColor,
      number_of_lines: 0,
      text_alignment: UITextAlignmentCenter,
      font: UIFont.boldSystemFontOfSize(18.0),
      resize: [ :left, :right, :top ], # ProMotion sugar here
      frame: CGRectMake(10, 250, 300, 66),
      size_to_fit: [] # ProMotion splats -> like calling the method with no params
    }
  end

  def title_image_style
    {
      frame: CGRectMake(0, 62, 316, 180)
    }
  end

  def help_view_style
    {
      background_color: 0x3e3e3e.uicolor
    }
  end
end