require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  should_have_before_filter :require_user, :formats => [:html]
  
  context "on index" do
    context "if user is an admin" do
      before :each do
        login_admin
        Contract.stub!(:all).and_return(@contracts = build_contracts)
        get :index
      end
      
      it "should render admin" do
        response.should render_template('application/admin')
      end
      
      it "should return contracts as @contracts" do
        assigns[:contracts].should eql(@contracts)
      end
    end
    
    it "should render manager if the user is a manager" do
      login_manager
      get :index
      response.should render_template('application/manager')
    end
    
    it "should render index if the user is not a manager nor an admin" do
      login
      get :index
      response.should render_template('application/index')
    end
  end
end