require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReportsController do
  before :each do
    login_admin
  end
  should_have_before_filter :require_admin
  
  context "on reports" do
    before :each do
      @id = "34"
      @begin_date, @finish_date = '01/02/1998', '02/04/2008'
    end
    
    it "should look for the cost of a contract in a period" do
      Entry.should_receive(:cost_by_contract).with(@id, :from => Time.parse(@begin_date), :to => Time.parse(@finish_date))
      get :cost_by_contract, :id => @id, :from => @begin_date, :to => @finish_date
    end
    
    it "should look for the cost of a project in a period" do
      Entry.should_receive(:cost_by_project).with(@id, :from => Time.parse(@begin_date), :to => Time.parse(@finish_date))
      get :cost_by_project, :id => @id, :from => @begin_date, :to => @finish_date
    end
    
    it "should look for the cost of an user in a period" do
      Entry.should_receive(:cost_by_user).with(@id, :from => Time.parse(@begin_date), :to => Time.parse(@finish_date))
      get :cost_by_user, :id => @id, :from => @begin_date, :to => @finish_date
    end
  end
end