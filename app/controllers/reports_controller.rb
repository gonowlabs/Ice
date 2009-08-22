class ReportsController < InheritedResources::Base
  respond_to :xml, :json
  before_filter :require_admin
  
  def cost_by_contract
    @entries = Entry.cost_by_contract params[:id], params
  end
  
  def cost_by_project
    @entries = Entry.cost_by_project params[:id], params
  end
end