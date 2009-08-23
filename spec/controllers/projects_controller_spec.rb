require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ProjectsController do
  before :each do
    login_admin
  end
  should_have_before_filter :require_admin
  should_behave_like_resource :in => :contract
end
