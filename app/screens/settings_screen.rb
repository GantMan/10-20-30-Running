class SettingsScreen < PM::TableScreen
  searchable placeholder: "Search stuff"

  title "Settings"

  def table_data
    [{
      title: "",
      cells: State.all.map { |state| { title: state.name, action: :tapped_state } }
    }]
  end

  def tapped_state(args={})
    PM.logger.debug args
  end
end
