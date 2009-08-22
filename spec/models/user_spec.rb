require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  should_have_and_belong_to_many :projects
  should_be_authentic
  
  it "should identify an user as admin" do
    User.new(:role => User::ADMIN).admin?.should be_true
  end
end