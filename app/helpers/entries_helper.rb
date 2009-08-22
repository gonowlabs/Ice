module EntriesHelper
  def localized_week_days
    week_days = I18n.t 'date.day_names'
    sunday = week_days.shift
    week_days.push sunday
  end

  def localized_week_dates(base_date)
    week_dates(base_date).map {|date| I18n.localize date}
  end
  
  def week_dates(base_date)
    result = []
    7.times {|day_of_week| result << base_date.monday + day_of_week }
    result
  end
end
