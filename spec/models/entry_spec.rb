require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Entry do
  should_belong_to :user
  should_belong_to :project

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
