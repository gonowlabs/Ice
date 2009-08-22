class UserSessionsController < InheritedResources::Base
  skip_before_filter :require_user, :only => [:new, :create]
  
  def destroy
    current_user_session.destroy
    flash[:notice] = I18n.t :logout_successful
    redirect_back_or_default root_path
  end
end