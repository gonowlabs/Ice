class EntriesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :update

  def update
    params[:projects].each do |project_id, entries|
      project = Project.find project_id
      entries.each do |week_day, hours|
        date = Date.today
        Entry.update_hour current_user, project, date, hours
      end
    end
  end
end