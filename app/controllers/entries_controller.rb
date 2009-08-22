class EntriesController < ApplicationController
  def update
    if current_user.manager?
      Entry.update params[:id], :status => params[:status]
    else
      Entry.update_all("hours = #{params[:hours]}", "status = #{Entry::REJECTED} AND id = #{params[:id]}")
    end
    render :file => :nothing
  end
end