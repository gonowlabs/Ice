# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthlogicHelper

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password
  before_filter :require_user

  def index
    if current_user.admin?
      render_admin
    elsif current_user.manager?
      render_manager
    else
      render_worker
    end
  end
  
  private
  
  def render_admin
    @contracts = Contract.all
    @users = User.all
    render 'admin'
  end
  
  def render_manager
    @projects = Project.find_all_by_manager_id(current_user.id)
    @reference_date = Date.today
    render 'manager'
  end
  
  def render_worker
    @reference_date = Date.today
  end
end
