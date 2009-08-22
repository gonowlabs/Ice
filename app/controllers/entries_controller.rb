class EntriesController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :index, :update

  def update
    params[:entries].each do |entry_id, hours|
      entry = Entry.find(entry_id)
      entry.hours = hours
      entry.save!
    end
    redirect_to root_path
  end
end