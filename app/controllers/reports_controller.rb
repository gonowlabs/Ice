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
    query_params = {:joins => {:project, :contract}, :order => :date}
    query_params.deep_merge! EntryReport.group_by(params[:filters][:group_by])
    query_params.deep_merge! EntryReport.between(params[:filters][:period][:from], params[:filters][:period][:to])
    query_params.deep_merge! EntryReport.filter_contracts(params[:filters][:contracts].keys)
    query_params.deep_merge! EntryReport.filter_projects(params[:filters][:projects].keys)
    query_params.deep_merge! EntryReport.filter_users(params[:filters][:users].keys)

    @report_data = EntryReport.process_period(query_params, params[:filters][:period][:scale])
  end
end
