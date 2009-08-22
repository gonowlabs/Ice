class EntriesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :update
  helper_method :week_dates

  def update
    params[:entries].each do |entry_id, hours|
      entry = Entry.find(entry_id)
      entry.hours = hours
      entry.save!
    end
    redirect_to root_path
  end

  def week_dates(base_date)
    result = []
    7.times {|i| result << base_date.monday + i }
    result
  end
end
