require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Project do
  should_belong_to :contract
  should_belong_to :manager, :class_name => 'User'
  should_have_and_belong_to_many :users
  should_have_many :entries
  should_validate_presence_of :name, :contract

#  context "when retrieving user entries by week and user" do
#    before :all do
#      @entries = build_entries
#      @project = Factory(:project_1)
#      @user = Factory(:user_a)
#    end

#    it "should apply the user filter" do
#      starting_date = Date.today.monday
#      ending_date = Date.today.sunday
#      entries = @project.entries.for_week_and_user(Date.today, @user)
#    end
#  end
end
