class ReportsController < InheritedResources::Base
  respond_to :html
  actions :index
  before_filter :require_admin
  
  def cost_by_contract
    @cost = Entry.cost_by_contract params[:id], :from => params[:from].to_date, :to => params[:to].to_date
    render "show"
  end
  
  def cost_by_project
    @cost = Entry.cost_by_project params[:id], :from => params[:from].to_date, :to => params[:to].to_date
    render "show"
  end
  
  def cost_by_user
    @cost = Entry.cost_by_user params[:id], :from => params[:from].to_date, :to => params[:to].to_date
    render "show"
  end

  def index
    @contracts = Contract.all
    @users = User.all
  end

  def generate
    @report_data = EntryReport.generate(params[:filters])
  end
end
