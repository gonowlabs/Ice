require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  should_have_and_belong_to_many :projects
  should_have_many :entries
  should_be_authentic
  
  it "should identify an user as admin" do
    User.new(:role => User::ADMIN).admin?.should be_true
  end
  
  it "should identify an user isnt an admin" do
    User.new.admin?.should be_false
  end
  
  it "should identify an user is a manager" do
    User.new(:role => User::MANAGER).manager?.should be_true
  end
  
  it "should identify an user isnt a manager" do
    User.new.manager?.should be_false
  end
  
  it "should return entries for a week and a project" do
    user = Factory(:user_a)
    project = Factory(:project_1)
    user.entries.for_week_and_project(Date.today, project)
    Entry.find_by_user_id_and_project_id_and_date(user.id, project.id, Date.today).should_not be_nil
  end
end