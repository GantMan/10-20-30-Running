class HelpScreen < PM::Screen
  title "Help"

  def on_load
    set_nav_bar_button :left, title: "Close", action: :close_tapped
  end

  def will_appear
    @view_setup ||= self.set_up_view
  end

  def set_up_view
    #set_attributes self.view, :home_view_style 
    @title_image = add UIImageView.alloc.initWithImage('help'.uiimage)#, :underline_image_style
    true
  end

  def close_tapped
    close
  end
end
