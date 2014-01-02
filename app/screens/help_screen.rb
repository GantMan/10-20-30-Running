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
        title: "Exercise Plan",
        rows: [{
          title: "Total Cycle Blocks",
          key: :cycles_count,
          type: :picker,
          items: [['Forever', '0'], ['1','1'], ['2','2'], ['3','3'], ['4','4'], ['5','5']],
          input_accessory: :done
        },{
          title: "Seconds Between Blocks",
          key: :rest_blocks,
          type: :number,
          input_accessory: :done
        }]
      },{
        title: "Sound",
        rows: [{
          title: "Alert Sounds",
          key: :alert_sound,
          type: :subform,
          display_key: :sound,
          subform: {
            title: "Alert Sounds",
            sections: [{
              key: :sound,
              select_one: true,
              rows: [{
                title: "Beeps",
                key: :Beeps,
                type: :check
              },{
                title: "Boops",
                key: :Boops,
                type: :check
              }]
            }]
          }
        },{
          title: "Lead Up Alert",
          key: :lead_up_alert,
          type: :switch
        }]
      }]
    }
  end

  def close_tapped
    close
  end
end

