require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  should_belong_to :contract
  should_belong_to :manager, :class_name => 'User'
  should_have_and_belong_to_many :users
  should_have_many :entries
  should_validate_presence_of :name, :contract

  context "when retrieving user entries by week and user" do
    before :each do
      Contract.destroy_all
      User.destroy_all
      Entry.destroy_all
      @project = Factory(:project_1)
      @user = Factory(:user_a)
      @starting_date = Date.today.monday
      @ending_date = Date.today.sunday
    end

    context "and there are no entries" do
      before :each do
        @entries = @project.entries.for_week_and_user(Date.today, @user)
      end

      it "should return 7 new entries" do
        @entries.length.should == 7
      end
      it "the first should correspond to the start of the week" do
        @entries.first.date.should == @starting_date
      end
      it "the last should correspond to the end of the week" do
        @entries.last.date.should == @ending_date
      end
    end

    context "and there are less then 7 records for the week" do
      before :each do
        Factory(:entry, :user => @user, :project => @project, :date => Date.today)
        @entries = @project.entries.for_week_and_user(Date.today, @user)
      end

      it "should return 7 new entries" do
        @entries.length.should == 7
      end
      it "the first should correspond to the start of the week" do
        @entries.first.date.should == @starting_date
      end
      it "the last should correspond to the end of the week" do
        @entries.last.date.should == @ending_date
      end
    end

    context "and there are entries from other users in the same project" do
      before :each do
        @user_b = Factory(:user_b, :projects => [@project])
        Factory(:entry, :user => @user_b, :project => @project, :date => Date.today)
        @entries = @project.entries.for_week_and_user(Date.today, @user)
      end
      it "all entries should belong to the same user" do
        @entries.all? {|entry| entry.user == @user}.should be_true
      end
      it "and the entries of the other users shouldn't change" do
        @entries = @project.entries.between(@starting_date, @ending_date, @user_b)
        @entries.length.should == 1
      end
    end
  end
end
