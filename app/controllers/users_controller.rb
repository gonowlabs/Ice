class UsersController < InheritedResources::Base
  respond_to :html
  skip_before_filter :require_user, :only => [:new, :create]
  before_filter :require_admin, :only => [:edit, :update]
end
