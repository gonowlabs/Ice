module EntriesHelper
  def localized_week_days
    week_days = I18n.t 'date.day_names'
    sunday = week_days.shift
    week_days.push sunday
  end
end
