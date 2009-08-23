class UserSessionsController < InheritedResources::Base
  skip_before_filter :require_user

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new params[:user_session]
    if @user_session.save
      flash[:notice] = I18n.t :login_successful
      redirect_back_or_default root_path
    else
      render :action => :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = I18n.t :logout_successful
    redirect_back_or_default root_path
  end
end
