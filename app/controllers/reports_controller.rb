class ReportsController < InheritedResources::Base
  respond_to :xml, :json
  before_filter :require_admin
  
  def cost_by_contract
    @entries = Entry.cost_by_contract params[:contract_id], params
  end
end