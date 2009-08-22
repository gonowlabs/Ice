require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/new.html.erb" do
  include ContractsHelper
  
  before(:each) do
    assigns[:contract] = stub_model(Contract,
      :new_record? => true
    )
  end

  it "renders new contract form" do
    render
    
    response.should have_tag("form[action=?][method=post]", contracts_path) do
    end
  end
end


