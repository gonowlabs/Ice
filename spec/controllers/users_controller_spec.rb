require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
  before :each do 
    login_admin
  end

  should_behave_like_resource
  should_have_before_filter :require_admin, :only => [:edit, :update]
end