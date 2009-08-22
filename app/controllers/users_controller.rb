class UsersController < InheritedResources::Base
  respond_to :html, :xml, :json
  skip_before_filter :require_user, :on => [:new, :create]
end