require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/index.html.erb" do
  include ContractsHelper
  
  before(:each) do
    assigns[:contracts] = [
      stub_model(Contract),
      stub_model(Contract)
    ]
  end

  it "renders a list of contracts" do
    render
  end
end

