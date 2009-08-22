require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationController do
  should_have_before_filter :require_user, :formats => [:html]

  context "on index" do
    context "if user is an admin" do
      before :each do
        login_admin
        User.stub!(:all).and_return(@users = build_users)
        Contract.stub!(:all).and_return(@contracts = build_contracts)
        get :index
      end

      it "should render admin" do
        response.should render_template('application/admin')
      end

      it "should return contracts as @contracts" do
        assigns[:contracts].should eql(@contracts)
      end

      it "should return users as @users" do
        assigns[:users].should eql(@users)
      end
    end

    context "if user is a manager" do
      it "should render manager" do
        login_manager
        get :index
        response.should render_template('application/manager')
      end
    end

    context "if user is a worker" do
      before :each do
        login
      end

      it "should render index" do
        get :index
        response.should render_template('application/index')
      end

      it "should return today as the reference date for the week as default" do
        get :index
        assigns[:reference_date].should eql(Date.today)
      end
    end
  end
end
