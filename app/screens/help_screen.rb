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
    true
  end

  def close_tapped
    close
  end
end
