require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ApplicationHelper do
  include ApplicationHelper
  
  it "returns all projects from a list of contracts" do
    contracts = build_contracts
    projects_from(contracts).last.should eql(contracts.last.projects.last)
  end
  
  it "should return worker users from a list of users" do
    worker_users = [User.new, User.new]
    users = worker_users + [User.new(:role => User::ADMIN), User.new(:role => User::MANAGER)]
    workers(users).should eql(worker_users)
  end
end