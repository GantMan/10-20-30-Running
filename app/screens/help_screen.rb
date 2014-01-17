class HelpScreen < PM::Screen
  include HelpStyles
  title "Help"

  def on_load
    set_nav_bar_button :left, title: "Close", action: :close_tapped
  end

  def will_appear
    @view_setup ||= self.set_up_view
  end

  def set_up_view
    set_attributes self.view, :help_view_style 
    add UIImageView.alloc.initWithImage('help'.uiimage), :title_image_style
    add UILabel.new, :help_label_style
    add @video_button = UIButton.rounded_rect, :video_button_style
    @video_button.setTitle("View Video", forState:UIControlStateNormal)
    @video_button.on(:touch) do 
      "http://www.youtube.com/watch?v=MQvVXJubm5I".nsurl.open
    end
    true
  end

  def close_tapped
    close
  end
end
