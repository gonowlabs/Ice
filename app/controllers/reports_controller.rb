class ReportsController < InheritedResources::Base
  respond_to :xml, :json
  before_filter :require_admin
  
  def cost_by_contract
    @cost = Entry.cost_by_contract params[:id], :from => Time.parse(params[:from]), :to => Time.parse(params[:to])
    render "show"
  end
  
  def cost_by_project
    @cost = Entry.cost_by_project params[:id], :from => Time.parse(params[:from]), :to => Time.parse(params[:to])
    render "show"
  end
  
  def cost_by_user
    @cost = Entry.cost_by_user params[:id], :from => Time.parse(params[:from]), :to => Time.parse(params[:to])
    render "show"
  end
end