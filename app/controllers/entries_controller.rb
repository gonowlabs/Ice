class EntriesController < ApplicationController
  def update
    if current_user.manager?
      Entry.update params[:id], :status => params[:status]
    else
      Entry.update_all("hours = #{params[:hours]}", "(status is null or status <> #{Entry::APPROVED}) AND id = #{params[:id]}")
    end
    render :nothing => true
  end
end
