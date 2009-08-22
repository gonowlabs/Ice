require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/show.html.erb" do
  include ContractsHelper
  before(:each) do
    assigns[:contract] = @contract = stub_model(Contract)
  end

  it "renders attributes in <p>" do
    render
  end
end

