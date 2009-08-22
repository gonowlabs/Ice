require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthenticatedController do
  it "deve incluir os helpers do Authlogic" do
    AuthenticatedController.should include(AuthlogicHelper)
  end
end