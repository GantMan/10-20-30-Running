# This is a simple, CSS-like way to style your application.
# You can set these attributes in your screens by using `add` or `set_attributes`
# and passing in the method you want to use.
#
# Example usage: `add UILabel.new, :label_view_style`
module HomeStyles
  def label_view_style
    {
      text: "To begin your 10-20-30 Running cycle, start your music (if any), and then press the start button below.",
      text_color: UIColor.whiteColor,
      background_color: UIColor.clearColor,
      shadow_color: UIColor.blackColor,
      number_of_lines: 0,
      text_alignment: UITextAlignmentCenter,
      font: UIFont.boldSystemFontOfSize(18.0),
      resize: [ :left, :right, :top ], # ProMotion sugar here
      frame: CGRectMake(10, 150, 300, 1),
      size_to_fit: [] # ProMotion splats -> like calling the method with no params
    }
  end

  def home_view_style
    {
      background_color: UIColor.blackColor
    }
  end

  def title_label_style
    {
      text: "10 20 30",
      dotType: FBFontDotTypeSquare,
      numberOfBottomPaddingDot: 1,
      numberOfTopPaddingDot: 1,
      numberOfLeftPaddingDot: 2,
      numberOfRightPaddingDot: 2,
      glowSize: 20.0,
      innerGlowSize: 3.0,
      edgeLength: 4.0,
      frame: CGRectMake(10, 70, 305, 52),
      resetSize: [] # ProMotion splats -> like calling the method with no params
    }
  end
end
