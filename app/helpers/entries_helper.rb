module EntriesHelper
  def localized_week_days
    week_days = I18n.t 'date.day_names'
    sunday = week_days.shift
    week_days.push sunday
  end

  def format_hour(hours)
    str = hours.to_s
    parts = str.split('.')
    parts[1].to_i == 0 ? parts[0] : str
  end
end
