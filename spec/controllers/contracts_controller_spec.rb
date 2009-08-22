require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContractsController do
  before :each do
    login
  end
  should_behave_like_resource
  should_have_before_filter :require_admin
end
