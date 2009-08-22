require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  should_have_and_belong_to_many :projects
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
end