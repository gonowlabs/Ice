require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsController do
  before :each do
    login
  end
  should_behave_like_resource
end