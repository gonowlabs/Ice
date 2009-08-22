require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ReportsController do
  before :each do
    login_admin
  end
  should_have_before_filter :require_admin
  
  context "on reports" do
    before :each do
      @begin_date, @finish_date = Date.today - 20, Date.today - 5
    end
    
    it "should look for the cost for a contract in a period" do
      contract_id = "4"
      Entry.should_receive(:cost_by_contract).with(contract_id, hash_including(:from => @begin_date, :to => @finish_date))
      get :cost_by_contract, :contract_id => contract_id, :from => @begin_date, :to => @finish_date
    end
  end
end