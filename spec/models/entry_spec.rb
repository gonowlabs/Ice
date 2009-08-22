require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entry do
  before :all do
    User.delete_all
  end
  
  should_belong_to :user
  should_belong_to :project
  should_validate_presence_of :user, :project, :date

  context "uniqueness" do
    before :each do
      project = Factory(:project_1)
      user = Factory(:user_a, :projects => [project])
      Factory(:entry_1, :project => project, :user => user)
    end
    should_validate_uniqueness_of :date, :scope => [:user_id, :project_id]
  end

  context "reporting approved hours" do
    before :each do
      @begin_date, @finish_date = Date.today - 10, Date.today
      @entries = build_entries
    end
    
    it "should return the cost for a contract in a period" do
      contract_id = 10
      result = @entries.sum {|entry| entry.hours}
      Entry.should_receive(:sum).with(:hours, :joins => :project, 
        :conditions => {:projects => {:contract_id => contract_id}, :date => (@begin_date..@finish_date), :status => Entry::APPROVED}).and_return(result)
      cost = Entry.cost_by_contract contract_id, :from => @begin_date, :to => @finish_date
      cost.should eql(result)
    end

    it "should return the cost for a project in a period" do
      project_id = 10
      result = @entries.sum {|entry| entry.hours}
      Entry.stub!(:sum).with(:hours, :conditions => {:project_id => project_id, :date => (@begin_date..@finish_date), :status => Entry::APPROVED}).and_return(result)
      cost = Entry.cost_by_project project_id, :from => @begin_date, :to => @finish_date
      cost.should eql(result)
    end
    
    it "should return the cost for a user in a period" do
      user_id = 10
      result = @entries.sum {|entry| entry.hours}
      Entry.stub!(:sum).with(:hours, :conditions => {:user_id => user_id, :date => (@begin_date..@finish_date), :status => Entry::APPROVED}).and_return(result)
      cost = Entry.cost_by_user user_id, :from => @begin_date, :to => @finish_date
      cost.should eql(result)
    end
  end
end
