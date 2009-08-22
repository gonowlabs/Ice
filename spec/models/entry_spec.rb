require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entry do
  should_belong_to :user
  should_belong_to :project
  
  context "reports" do
    before :each do
      @begin_date, @finish_date = Date.today - 10, Date.today
      @entries = build_entries
    end
    
    it "should return the cost for a contract in a period" do
      contract_id = 10
      Entry.stub!(:all).with(:joins => "JOIN projects on projects.id = project_id", :conditions => ['projects.contract_id = ? AND date BETWEEN ? AND ?', contract_id, @begin_date, @finish_date]).and_return(@entries)
      result = @entries.map { |entry| entry.hours }.reduce { |a, b| a + b }
      cost = Entry.cost_by_contract contract_id, :from => @begin_date, :to => @finish_date
      cost.should eql(result)
    end

    it "should return the cost for a project in a period" do
      project_id = 10
      Entry.stub!(:find_all_by_project_id).with(project_id, :conditions => ['date BETWEEN ? AND ?', @begin_date, @finish_date]).and_return(@entries)
      result = @entries.map { |entry| entry.hours }.reduce { |a, b| a + b }
      cost = Entry.cost_by_project project_id, :from => @begin_date, :to => @finish_date
      cost.should eql(result)
    end
    
    it "should return the cost for a user in a period" do
      user_id = 10
      Entry.stub!(:find_all_by_user_id).with(user_id, :conditions => ['date BETWEEN ? AND ?', @begin_date, @finish_date]).and_return(@entries)
      result = @entries.map { |entry| entry.hours }.reduce { |a, b| a + b }
      cost = Entry.cost_by_user user_id, :from => @begin_date, :to => @finish_date
      cost.should eql(result)
    end
  end

  before :all do
    User.destroy_all
    @user = Factory :user
    @project = Factory :project
    @date = Date.today
  end

  context "when updating user's entries" do
    before :all do
      @entry_a = create_or_update_entry(8)
      @entry_b = create_or_update_entry(20)
    end

    it "the first update should equal 8 hours" do
      @entry_a.hours.should == 8
    end
    it "the second update should equal 20 hours" do
      @entry_b.hours.should == 20
    end
    it "but they should use the same record" do
      @entry_a.should == @entry_b
    end
  end


  def create_or_update_entry(hours)
    Entry.update_hour @user, @project, @date, hours
    entry = @user.entries.first :conditions => {:project_id => @project, :date => @date}
  end
end