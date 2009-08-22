require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  should_have_before_filter :require_user, :formats => [:html]
  
  context "on index" do
    it "should render admin if the user is an admin" do
      login_admin
      get :index
      response.should render_template('application/admin')
    end
  end
end