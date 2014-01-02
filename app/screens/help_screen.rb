class HelpScreen < PM::FormotionScreen
  title "Help"

  def on_load
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0) if (UIDevice.currentDevice.systemVersion.floatValue >= 7.0)
  end

  def will_appear
    set_nav_bar_button :left, title: "Close", action: :close_tapped
    
    # This is a workaround for an iOS 7 issue.
    # Ref: https://github.com/clearsightstudio/ProMotion/issues/348
    self.navigationController.navigationBar.translucent = false
  end

  def table_data
    {
      sections: [{
        title: "Cycles",
        rows: [{
          title: "Total Cycles",
          key: :email,
          placeholder: "example@kohactive.com",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        },
        {
          title: "Password",
          key: :password,
          placeholder: "",
          type: :string,
          auto_correction: :no,
          auto_capitalization: :none
        }]
      },
      {
        title: "Sound",
        rows: [{
          title: "Alert Sound",
          key: :alert_sound,
          type: :string

        },
        {
          title: "Lead Up Alert",
          key: :lead_up_alert,
          type: :string
        }]
      }]
    }
  end

  def close_tapped
    close
  end
end

# class HelpScreen < PM::GroupedTableScreen
#   title "Help"
  

#   def table_data
#     [
#       {
#       title: "Cycles",
#       cells: [
#         { title: "Total Cycles", action: :email_us }
#       ]
#       },
#       {
#       title: "Sound",
#       cells: [
#         { title: "Alert Sound", action: :email_us },
#         {
#           title: "Lead Up Alert",
#           accessory: {
#             view: :switch,
#             action: :lead_up_switch,
#             arguments: { message: "I'm switched!" }
#           }
#         }
#       ]
#       }

#     ]
#   end

# end
